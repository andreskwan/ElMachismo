//
//  Card.h
//  Matchismo
//
//  Created by Andres Kwan on 2/19/13.
//  Copyright (c) 2013 Andres Kwan O. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString            * contents;

@property (strong, getter = isChosen) BOOL        chosen;
@property (strong, getter = isChosen) BOOL        matched;


@property (nonatomic, getter = isFaceUp) BOOL     faceUp;

//TODO what makes that a card is playable or not?
@property (nonatomic, getter = isUnplayable) BOOL unpleyable;


//its not going to modify the otherCards so that is why is a NSArray
- (int)match:(NSArray *)otherCards;



@end
