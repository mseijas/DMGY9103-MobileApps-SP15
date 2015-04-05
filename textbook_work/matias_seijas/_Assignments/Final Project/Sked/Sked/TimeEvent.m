//
//  TimeEvent.m
//  Sked
//
//  Created by Matias Seijas on 4/5/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "TimeEvent.h"

@implementation TimeEvent

// Designated initializer
- (instancetype)initWithEventName:(NSString *)name
                       eventColor:(UIColor *)color;
{
    self = [super init];
    
    if (self) {
        _eventName = name;
        _eventColor = color;
        
        _startTime = [[NSDate alloc] init];
    }
    
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


@end
