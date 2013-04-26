//
//  CardMatchingGame.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/26/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int        score;
@property (strong,nonatomic) NSMutableArray * cards; //just for cards

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

//draw out cards from the deck
//and store them is an structure
//which hold the playable cards
- (id)initWIthCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    //I need to call my super's designated initializer
    //if I was in a convenience initializer
    //I should call my designated initializer.
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            //if count > deck size we have a malformed card-matching game
            //so we want to return nill from our init
            //because we can't initialize, given the arguments that were past
            if (!card) {
                self = nil;
                //do not continue
                break;
            }else{
                //NSMutableArray will crash if card is nil
                self.cards[i] = card;
            }
        }
    }
    return self;
}
@end
