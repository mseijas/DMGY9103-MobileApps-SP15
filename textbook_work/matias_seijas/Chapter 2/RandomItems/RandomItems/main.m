//;
//  main.m
//  RandomItems
//
//  Created by Matias Seijas on 1/31/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            
            [items addObject:item];
            
        }
        
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa"
//                                           valueInDollars:100
//                                             serialNumber:@"A1B2C"];
//        
//        
//        /* NSLog(@"%@ %@ %@ %d", [item itemName],
//                                 [item dateCreated],
//                                 [item serialNumber],
//                                 [item valueInDollars]); */
//        
//        // NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated, item.serialNumber, item.valueInDollars);
//        
//        NSLog(@"%@", item);
//        
//        BNRItem *itemWithname = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        NSLog(@"%@", itemWithname);
//        
//        BNRItem *itemWithNoName = [[BNRItem alloc] init];
//        NSLog(@"%@", itemWithNoName);
        
        // Destroy the mutable array object
        items = nil;
        
    }
    return 0;
}
