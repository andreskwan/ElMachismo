//
//  PlayingCardGameViewController.m
//  ElMachismo
//
//  Created by Andres Kwan on 12/10/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}


@end
