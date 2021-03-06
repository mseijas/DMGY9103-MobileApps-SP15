//
//  TimeEvent.h
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TimeEvent : NSObject <NSCoding>

@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSDate *startTime;
@property (nonatomic, copy) NSDate *endTime;
@property (nonatomic, copy) UIColor *eventColor;


- (instancetype)initWithEventName:(NSString *)name
                       eventColor:(UIColor *)color;

- (instancetype)initWithEventName:(NSString *)name;

- (void)endTimeEvent;

@end
