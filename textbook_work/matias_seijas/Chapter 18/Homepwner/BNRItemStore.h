//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Matias on 3/3/15.
//  Copyright (c) 2015 Matias. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedStore;
- (BNRItem *) createItem;
- (void) removeItem:(BNRItem *) item;

- (void) moveItemAtIndex: (NSUInteger) fromIndex
                 toIndex: (NSUInteger) toIndex;

- (BOOL)saveChanges;

@end
