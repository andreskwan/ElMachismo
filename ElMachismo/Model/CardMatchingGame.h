//
//  CardMatchingGame.h
//  ElMachismo
//
//  Created by Andres Kwan on 4/26/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//when you have an init that you must call to make your class work
//it's required, then we call it

//Designated Initializer

//other initializers are called
//convenience initializers

//what should I do with the inherited initilializer
//OVERRIDE it and return nil

//others will set the information to start a new game
//like
//- the number of cards to play with
//- deck to play with
//because this class can't know with which deck do you want to play
//and with how many cards!!!
- (id)initWIthCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;

//this method does all the work
//- flips the card over
//- checks whether they match
//- flips cards back if they don't match
//- set the score
- (void)flipCardAtIndex:(NSUInteger)index;

//allow others to get the card, that's all
- (Card *)cardAtIndex:(NSUInteger)index;

//it's only a public getter
//nobody should change the score
@property (readonly, nonatomic) int           score;

@end
