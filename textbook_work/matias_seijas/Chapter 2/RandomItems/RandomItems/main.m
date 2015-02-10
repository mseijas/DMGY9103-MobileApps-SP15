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
        
        BNRContainer *myContainer = [[BNRContainer alloc] initWithItemName:@"TEST1" valueInDollars:100 serialNumber:@"B3H8GG"];
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 3; i++) {
            BNRItem *item = [BNRItem randomItem];
            
            [items addObject:item];
            [myContainer addToContainer:item];
            
        }
        
        
        
        BNRContainer *myContainer2 = [[BNRContainer alloc] initWithItemName:@"TEST-SUBCONTEINER" valueInDollars:50 serialNumber:@"H444"];
        
        NSMutableArray *items2 = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 2; i++) {
            BNRItem *item = [BNRItem randomItem];
            
            [items2 addObject:item];
            [myContainer2 addToContainer:item];
            
        }
        
        [myContainer addToContainer:myContainer2];
        
        
        
        NSLog(@"%@", myContainer);
    
        items = nil;
        
    }
    return 0;
}
