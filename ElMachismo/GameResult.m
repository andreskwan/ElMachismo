//
//  GameResult.m
//  ElMachismo
//
//  Created by Andres Kwan on 5/30/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;

@end

@implementation GameResult

- (id) init
{
    self = [super init];
    if (self) {
        //don't use setters and getters in initializers
        //specialy in my designated initializer
        _start = [NSDate date];
        _end   = _start;
    }
    return self;
}

- (NSTimeInterval) duration
{
    return [self.end timeIntervalSinceDate:self.start];
}


- (void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
}
@end
