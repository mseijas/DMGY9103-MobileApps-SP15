//
//  BNRContainer.h
//  RandomItems
//
//  Created by Matias Seijas on 2/4/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subItems;
    int _fullValue;
}

/* Designated initializer */
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;


- (void)addToContainer:(BNRItem *)itemToAdd;


- (int)fullValue;

@end
