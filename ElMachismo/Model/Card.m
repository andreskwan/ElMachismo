//
//  Card.m
//  Matchismo
//
//  Created by Andres Kwan on 2/19/13.
//  Copyright (c) 2013 Andres Kwan O. All rights reserved.
//

#import "Card.h"

@implementation Card

//never is going to find a match with just one deck
//all the 52 cards are differen!
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    //not taking care of the contents of the array!!!
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
