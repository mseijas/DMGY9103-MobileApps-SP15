//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Matias Seijas on 3/3/15.
//  Copyright (c) 2015 Matias. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController

- (instancetype)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);


@end
