//
//  TimeEventStore.h
//  
//
//  Created by Matias Seijas on 4/25/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TimeEvent;

@interface TimeEventStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;


+ (instancetype)sharedStore;

- (TimeEvent *)createWithEventName:(NSString *)name;
- (void)removeTimeEvent:(TimeEvent *)timeEvent;


- (BOOL)saveChanges;

@end
