//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Matias on 3/3/15.
//  Copyright (c) 2015 Matias. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"


@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end



@implementation BNRItemStore


+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}


// If a programmer calls [[BNRItemStore alloc] init], let him know the error of his ways
- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    
    return nil;
}


// Here is the real (secret) initializer
- (instancetype) initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}


- (NSArray *) allItems
{
    return self.privateItems;
}


- (BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}


- (void) removeItem:(BNRItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}


- (void) moveItemAtIndex:(NSUInteger)fromIndex
                 toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    // Get pointer to object being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
