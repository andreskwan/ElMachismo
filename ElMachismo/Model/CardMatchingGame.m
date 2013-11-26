//
//  CardMatchingGame.m
//  ElMachismo
//
//  Created by Andres Kwan on 11/24/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)NSInteger     score;
@property (nonatomic, strong)NSMutableArray * cards; //Of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if (_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0 ; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
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
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    
}

@end
