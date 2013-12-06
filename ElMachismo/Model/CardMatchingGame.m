//
//  CardMatchingGame.m
//  ElMachismo
//
//  Created by Andres Kwan on 11/24/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "CardMatchingGame.h"
#define MISMATCH_PENALTY 2
#define MATCH_BONUS      4
#define COST_TO_CHOOSE  -1


@interface CardMatchingGame()
@property (nonatomic, readwrite)NSInteger     score;
@property (nonatomic, strong)NSMutableArray * cards; //Of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0 ; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
                NSLog(@"card contents: %@ ",card.contents);

                NSLog(@"[self.cards objectAtIndex:i] : %@",[self.cards lastObject]);
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index
{
    //valid index?
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card * card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            //this means that this is the next card chosen
            //so if it is not a match let it go, unchoose it
            card.chosen = NO;
        }else{
            // match agains other chosen cards
            for (Card * otherCard in self.cards) {
                //it just going to try with a card that has been chosen
                //just one possibility
                if (!otherCard.isMatched && otherCard.isChosen) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                        
                    }else{
                        //pay for your mistake
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;//It was nill
                    }
                    break; // can only choose 2 cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
        
    }
}

@end
