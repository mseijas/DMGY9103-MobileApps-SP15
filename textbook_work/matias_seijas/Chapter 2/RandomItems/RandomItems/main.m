//;
//  main.m
//  RandomItems
//
//  Created by Matias Seijas on 1/31/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        BNRContainer *myContainer = [[BNRContainer alloc] initWithItemName:@"MyTest"];
        
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            
            [items addObject:item];
            [myContainer addToContainer:item];
            
        }
        
        
        NSLog(@"%@", myContainer);
    

        items = nil;
        
    }
    return 0;
}
