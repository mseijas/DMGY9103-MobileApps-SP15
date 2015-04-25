//
//  TimeEventStore.m
//  
//
//  Created by Matias Seijas on 4/25/15.
//
//

#import "TimeEventStore.h"
#import "TimeEvent.h"

@interface TimeEventStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end


@implementation TimeEventStore


/***  Initializers   ***/

+ (instancetype)sharedStore
{
    static TimeEventStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[TimeEventStore sharedStore]"];
    
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        NSString *path = [self timeEventsArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}


/***  Array Operations  ***/

- (NSArray *)allTimeEvents
{
    return [self.privateItems copy];
}

- (TimeEvent *)createWithEventName:(NSString *)name
{
    TimeEvent *timeEvent = [[TimeEvent alloc] initWithEventName:name];
    
    [self.privateItems addObject:timeEvent];
    
    return timeEvent;
}

- (void)removeTimeEvent:(TimeEvent *)timeEvent
{
    [self.privateItems removeObjectIdenticalTo:timeEvent];
}
                            
                            
/****   Persistent Data  ****/
                            
- (NSString *)timeEventsArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
        
    return [documentDirectory stringByAppendingPathComponent:@"timeEvents.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self timeEventsArchivePath];
    
    // Returns YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

@end
