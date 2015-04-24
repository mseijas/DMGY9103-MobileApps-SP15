//
//  TimeUtils.h
//  Sked
//
//  Created by Matias Seijas on 4/23/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+ (NSString *)timeDifferenceWithStart:(NSDate *)startDate
                                  End:(NSDate *)endDate;

@end
