//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Matias Seijas on 3/10/15.
//  Copyright (c) 2015 Matias Seijas. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void)loadview
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
