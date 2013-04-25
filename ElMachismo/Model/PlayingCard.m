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
    //not a good idea because you can't control A, J, Q, K
    return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
    
}

@end
