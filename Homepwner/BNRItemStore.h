//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Justin Wong on 25/11/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

// Compiler directive that says that a BNRItem class exists, and the compiler
// doesn't need to know the details of the class, just that the class exists
@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

// Notice that this is a class method, and prefixed with a `+` instead of a `-`
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;

@end
