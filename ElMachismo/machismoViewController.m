//
//  machismoViewController.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/22/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "machismoViewController.h"

@interface machismoViewController ()

@end

@implementation machismoViewController

- (IBAction)flipCard:(UIButton *)sender
{
    if (sender.isSelected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
}


@end
