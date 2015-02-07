//
//  BNRContainer.m
//  RandomItems
//
//  Created by Matias Seijas on 2/4/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer


/** INITIALIZERS **/

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    self = [super initWithItemName:name
                    valueInDollars:value
                      serialNumber:sNumber];
    
    if (self) {
        _subItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:sNumber];
}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

- (int)fullValue
{
    return _fullValue;
}

- (NSMutableArray *)subItems
{
    return _subItems;
}


/** METHODS **/

- (void)addToContainer:(BNRItem *)itemToAdd
{
    [_subItems addObject:itemToAdd];
    
    [self updateTotalValue];
}


- (void)updateTotalValue
{
    _fullValue = 0;
    for(BNRContainer *subItems in _subItems) {
        
        if ([subItems isKindOfClass:[BNRContainer class]]) {
            for (BNRContainer *container_subItems in subItems.subItems) {
                _fullValue += container_subItems.valueInDollars;
            }
            _fullValue += subItems.valueInDollars;
        } else {
            _fullValue += subItems.valueInDollars;
        }
        
    }
    _fullValue += self.valueInDollars;
}


- (NSMutableString *)description
{
    NSMutableString *descriptionString = [[NSMutableString alloc] init];
                                          
    [descriptionString appendString:@"** CONTAINER: "];
    [descriptionString appendString:[super description]];
    [descriptionString appendFormat:@"  -  TOTAL VALUE: $%d \n", self.fullValue];
    
    
    
    for (BNRItem *subItem in _subItems) {
        
        NSMutableString  *tempString = [[NSMutableString alloc] init];
        [tempString appendString:subItem.description];
        [tempString appendString:@"\n"];
        
        [descriptionString appendString:tempString];
        
    }
    
    return descriptionString;
}


@end
