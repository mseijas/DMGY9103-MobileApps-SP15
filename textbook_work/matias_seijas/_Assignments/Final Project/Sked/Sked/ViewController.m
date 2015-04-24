//
//  ViewController.m
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "ViewController.h"
#import "TimeEvent.h"
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

@end


@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
}

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
    
    countDown = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                          target:self
                                                        selector:@selector(updateView)
                                                        userInfo:nil
                                                         repeats:YES];
    
}

- (IBAction)endTimeEvent:(id)sender {
    
    NSLog(@"endTimeEvent clicked");
    
    _endTimeEvent.hidden = YES;
    _timeEventName.text = @"";
    
    [newTimeEvent endTimeEvent];
    
    _elapsedTime.text = @"";
    
    [countDown invalidate];
    
}

- (void)updateView {
    NSLog(@"Timer fired");
    
    //NSDate *tempDate = [[NSDate alloc] init];
    
    long totalTime = [newTimeEvent endTimeEvent];
    
    NSDate *date1 = newTimeEvent.startTime;
    NSDate *date2 = newTimeEvent.endTime;
    
    
    
//    NSString *strTotalTime = [NSString stringWithFormat:@"%ld", totalTime];
//    
//    _elapsedTime.text = strTotalTime;
    
    
//    // Get the system calendar
//    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
//    
//    // Create the NSDates
//    
//    
//    // Get conversion to months, days, hours, minutes
//    unsigned int unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitNanosecond;
//    
//    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
//    
//    NSString *msTime = [NSString stringWithFormat:@"%ldsec %ldmin %ldhours %lddays %ldmoths",(long)[conversionInfo second], (long)[conversionInfo minute], (long)[conversionInfo hour], (long)[conversionInfo day], (long)[conversionInfo month]];
    
    _elapsedTime.text = [TimeUtils timeDifferenceWithStart:date1 End:date2];
    
//    NSLog(@"Conversion: %ldsec %ldmin %ldhours %lddays %ldmoths",(long)[conversionInfo second], (long)[conversionInfo minute], (long)[conversionInfo hour], (long)[conversionInfo day], (long)[conversionInfo month]);
    

}

@end
