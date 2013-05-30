//
//  GameResultViewController.m
//  ElMachismo
//
//  Created by Andres Kwan on 5/30/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultViewController
-(void)setup
{
    //initialization that can't wait until viewDidLoad
}

- (void)awakeFromNib
{
    [self setup];
    
}
//designated initializer
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}



@end
