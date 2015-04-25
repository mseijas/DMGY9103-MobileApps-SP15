//
//  ViewController.m
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "ViewController.h"
#import "TimeEvent.h"
#import "TimeEventStore.h"
#import "TimeUtils.h"

@interface ViewController ()

{
    TimeEvent *newTimeEvent;
    NSTimer *countDown;
    NSDateFormatter *dateFormatter;
   // TimeUtils *timeUtils;

}

- (IBAction)startTimeEvent:(id)sender;
- (IBAction)endTimeEvent:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *startTimeEvent;
@property (weak, nonatomic) IBOutlet UIButton *endTimeEvent;
@property (weak, nonatomic) IBOutlet UITextField *timeEventName;

@property (weak, nonatomic) IBOutlet UILabel *elapsedTime;
@property (weak, nonatomic) IBOutlet UILabel *lastEvent;


@end


@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    /*TimeEventStore *timeEventStore = [TimeEventStore sharedStore];
    NSInteger numberEvents = [timeEventStore.allItems count];
    NSLog(@"EVENTS IN STORE: %ld", (long)numberEvents);*/
    NSLog(@"VIEW WILL APPEAR !!!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _elapsedTime.text = @"";
    
    NSLog(@"** VIEW DID LOAD ***");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimeEvent:(id)sender {
    
    NSLog(@"startTimeEvent clicked");
    
    _endTimeEvent.hidden = NO;
    
    
    NSString *eventName = _timeEventName.text;
    
    //newTimeEvent = [[TimeEvent alloc] initWithEventName:eventName];
    newTimeEvent = [[TimeEventStore sharedStore] createWithEventName:eventName];
    
    countDown = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                          target:self
                                                        selector:@selector(updateView)
                                                        userInfo:nil
                                                         repeats:YES];
    
}

- (IBAction)endTimeEvent:(id)sender {
    
    _endTimeEvent.hidden = YES;
    _timeEventName.text = @"";
    _elapsedTime.text = @"";
    
    [newTimeEvent endTimeEvent];
    [countDown invalidate];
    
}

- (void)updateView {
    
    NSDate *timerStart = newTimeEvent.startTime;
    NSDate *timerNow = [[NSDate alloc] init];
    
    _elapsedTime.text = [TimeUtils timeDifferenceWithStart:timerStart End:timerNow];

}

@end
