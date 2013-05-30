//
//  GameResult.h
//  ElMachismo
//
//  Created by Andres Kwan on 5/30/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

//when this class is instantiated the game start
@property (readonly, nonatomic)NSDate           *start;

//every time someone update the score, the game is ended
@property (readonly, nonatomic)NSDate           *end;

@property (readonly, nonatomic)NSTimeInterval   duration;

//is not readonly because you can change it!
@property (nonatomic) int score;
@end
