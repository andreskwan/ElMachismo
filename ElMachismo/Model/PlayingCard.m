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


#pragma mark properties
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

#pragma mark - Class methods
//those that are independent of the instance
+ (NSArray *)rankStrings
{
    return @[@"?", @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦",@"♠",@"♣"];
}

+ (NSUInteger)maxRank { return [self rankStrings].count - 1;}

#pragma mark overriding

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    //not taking care of the contents of the array!!!
    
    if ([otherCards count] == 1){
        PlayingCard * otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if( [otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}

- (int)matchWithManyCards:(NSArray *)otherCards
{
    int score = 0;
    //not taking care of the contents of the array!!!
    
    for (PlayingCard * otherCard in otherCards) {
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if( [otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}
@end
