//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Matias Seijas on 2/14/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
