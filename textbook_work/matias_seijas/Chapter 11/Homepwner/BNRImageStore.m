//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Matias Seijas on 3/8/15.
//  Copyright (c) 2015 Matias. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end


@implementation BNRImageStore

+ (instancetype)sharedStore
{
    static BNRImageStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// No one should call init
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRImageStore sharedStore]"];
    
    return nil;
}

// Secret designated private initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    [self.dictionary setObject:image forKey:key];

}

- (UIImage *)imageForKey:(NSString *)key
{
    return [self.dictionary objectForKey:key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}


@end
