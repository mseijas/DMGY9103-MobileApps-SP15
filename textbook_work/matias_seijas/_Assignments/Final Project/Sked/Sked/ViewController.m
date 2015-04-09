//
//  ViewController.m
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "ViewController.h"
#import "TimeEvent.h"

@interface ViewController ()

{
    TimeEvent *newTimeEvent;

}

- (IBAction)startTimeEvent:(id)sender;
- (IBAction)endTimeEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *startTimeEvent;
@property (weak, nonatomic) IBOutlet UIButton *endTimeEvent;
@property (weak, nonatomic) IBOutlet UITextField *timeEventName;

@property (weak, nonatomic) IBOutlet UILabel *elapsedTime;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _elapsedTime.text = @"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimeEvent:(id)sender {
    
    NSLog(@"startTimeEvent clicked");
    
    _endTimeEvent.hidden = NO;
    
    
    NSString *eventName = _timeEventName.text;
    
    newTimeEvent = [[TimeEvent alloc] initWithEventName:eventName];
    
}

- (IBAction)endTimeEvent:(id)sender {
    
    NSLog(@"endTimeEvent clicked");
    
    _endTimeEvent.hidden = YES;
    _timeEventName.text = @"";
    
    long totalTime = [newTimeEvent endTimeEvent];
    
    NSString *strTotalTime = [NSString stringWithFormat:@"%ld", totalTime];
    
    _elapsedTime.text = strTotalTime;
    
}
@end
