//
//  machismoViewController.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/22/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
//weak because this is displayed, this class do not control it
//is strong by the view
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//counts flips
@property (nonatomic)int                     flipcount;

@end

@implementation CardGameViewController

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
}

- (IBAction)touchCardButton:(UIButton *)sender {

    //if non zero front is showing
    if ([sender.currentTitle length]) {
        UIImage * cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        UIImage * cardImage = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"A♣" forState:UIControlStateNormal];
    }
}


@end
