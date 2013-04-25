//
//  PlayingCard.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/25/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString * )contents
{
    //2
    //control what to display at 0-?, 10-J, 11-Q, 12-K
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
   
}

#pragma mark suit property
@synthesize suit = _suit;


- (NSString *)suit
{
    //to avoid to return 0 or nil
    return _suit ? _suit : @"?";
}

//to avoid that someone set something different than valid suits
- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦",@"♠",@"♣"];
}

#pragma mark rank property
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
}


+ (NSUInteger)maxRank { return [self rankStrings].count - 1;}


@end
