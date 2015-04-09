//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Matias on 3/3/15.
//  Copyright (c) 2015 Matias. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"


@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end



@implementation BNRItemStore


+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
//    if (!sharedStore) {
//        sharedStore = [[self alloc] initPrivate];
//    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
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
       // _privateItems = [[NSMutableArray alloc] init];
        
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}


- (NSArray *) allItems
{
    return self.privateItems;
}


- (BNRItem *) createItem
{
    //BNRItem *item = [BNRItem randomItem];
    BNRItem *item = [[BNRItem alloc] init];
    
    [self.privateItems addObject:item];
    
    return item;
}


- (void) removeItem:(BNRItem *)item
{
    
    NSString *key = item.itemKey;
    
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    
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

- (NSString *)itemArchivePath
{
    // Make sure that the first argument is NSDocumentDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    // Returns YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}


@end
