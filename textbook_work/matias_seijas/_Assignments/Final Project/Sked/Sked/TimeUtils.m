//
//  TimeUtils.m
//  Sked
//
//  Created by Matias Seijas on 4/23/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

+ (NSString *)timeDifferenceWithStart:(NSDate *)startDate
                                End:(NSDate *)endDate
{
    NSString *timeDifference;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned int timeUnits = NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay;
    
    NSDateComponents *timeComponents = [calendar components:timeUnits fromDate:startDate toDate:endDate options:0];
    
    
    
    if ((long)[timeComponents day] > 0) {
        
        if ((long)[timeComponents day] == 1) {
            timeDifference = [NSString stringWithFormat:@"%ldday %ldh %ldm", (long)[timeComponents day], (long)[timeComponents hour], (long)[timeComponents minute]];
        }
        
        timeDifference = [NSString stringWithFormat:@"%lddays %ldh %ldm", (long)[timeComponents day], (long)[timeComponents hour], (long)[timeComponents minute]];
        
        return timeDifference;
    }
    
    if ((long)[timeComponents hour] > 0) {
        
        timeDifference = [NSString stringWithFormat:@"%ldh %ldm", (long)[timeComponents hour], (long)[timeComponents minute]];
        
        return timeDifference;
    }
    
    if ((long)[timeComponents minute] > 0) {
        
        timeDifference = [NSString stringWithFormat:@"%ldm %lds", (long)[timeComponents minute], (long)[timeComponents second]];
        
        return timeDifference;
    }
    
    timeDifference = [NSString stringWithFormat:@"%lds", (long)[timeComponents second]];
    
    return timeDifference;
    
}

@end
