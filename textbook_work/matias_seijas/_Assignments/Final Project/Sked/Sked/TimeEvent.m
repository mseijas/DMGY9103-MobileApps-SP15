//
//  TimeEvent.m
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "TimeEvent.h"
#import "TimeUtils.h"

@implementation TimeEvent


/***  Initializers   ***/
- (instancetype)initWithEventName:(NSString *)name
                       eventColor:(UIColor *)color;
{
    self = [super init];

    if (self) {
        _eventName = name;
        _eventColor = color;
        
        _startTime = [[NSDate alloc] init];
    }
    
    
    NSLog(@"Created TimeEvent, with Name: %@, Start Time: %@", name, [TimeUtils formatFullDate:_startTime]);
    
    return self;
    
}

- (instancetype)initWithEventName:(NSString *)name
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return [self initWithEventName:name eventColor:color];
}


/*** Class Methods ***/
- (void)endTimeEvent
{
    _endTime = [[NSDate alloc] init];
    
    NSLog(@"TimeEvent ended. Recorded Time: %@", [TimeUtils timeDifferenceWithStart:_startTime End:_endTime]);
    
}


/*** Persistent Data ***/
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.eventName forKey:@"eventName"];
    [aCoder encodeObject:self.startTime forKey:@"startTime"];
    [aCoder encodeObject:self.endTime forKey:@"endTime"];
    [aCoder encodeObject:self.eventColor forKey:@"eventColor"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self) {
        _eventName = [aDecoder decodeObjectForKey:@"eventName"];
        _startTime = [aDecoder decodeObjectForKey:@"startTime"];
        _endTime = [aDecoder decodeObjectForKey:@"endTime"];
        _eventColor = [aDecoder decodeObjectForKey:@"eventColor"];
    }
    
    return self;
}

@end
