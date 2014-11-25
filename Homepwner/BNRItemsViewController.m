//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Justin Wong on 25/11/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initialiser
    // Make all instsances of `BNRItemsViewController` use the "plain" style
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

@end
