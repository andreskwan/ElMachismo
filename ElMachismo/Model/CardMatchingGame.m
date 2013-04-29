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
@property (strong,nonatomic) NSMutableArray * cards; //just for card

@end

@implementation CardMatchingGame

//lazy instantiation
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
//the gust of the app
- (void)flipCardAtIndex:(NSUInteger)index
{
    Card * card = [self cardAtIndex:index];
    if (card && !card.isUnplayable) {
        if (card.isFaceUp) {
            //toogle the state
            for (Card * otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unpleyable = YES;
                        card.unpleyable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }else{
                        otherCard.faceUp = NO;
                        self.score += matchScore * MISMATCH_PENALTY;
                    }
                    break;
                }
            }

        }
        self.score -= FLIP_COST;
        card.faceUp = !card.isFaceUp;
    }
}

//protect agains index bigger than the size of the array
- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards [index] : nil;
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
