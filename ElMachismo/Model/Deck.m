//
//  Deck.m
//  Matchismo
//
//  Created by Andres Kwan on 2/19/13.
//  Copyright (c) 2013 Andres Kwan O. All rights reserved.
//

#import "Deck.h"
@interface Deck()
// private, we don't want none cheating with our cards
//strong no one should point at it
//mutable because we are going to add things to it
@property (strong, nonatomic) NSMutableArray *cards;
@end

//is not the same if I want to despose the cards and after the cards
//has been played deal all left over again.

@implementation Deck

//lazy instantiation
//cards getter
//alocate and initialize the array
-(NSMutableArray *)cards
{
    //if true returns a blank allocated array
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}


//what if the card I'm passing is nil?
// in an array is wrong, it's going to crash
// sending messages to nil does nothing
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    //verify if card is nil
    if (card) {
        if (atTop) {         
            //sending message insertObject:atIndex
            //if self.cards is nil then does nothing
            [self.cards insertObject:card atIndex:0];
        }else {
            [self.cards addObject:card];
        }
    }
}

- (void)addCard:(Card *)card
{
    
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;

    //you can't remove from a blank array so verify
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        //draw card
        randomCard = self.cards[index];
        //remove it from the array
        [self.cards removeObjectAtIndex:index];       
    }
    return randomCard;
}

@end
