//
//  GameResult.m
//  ElMachismo
//
//  Created by Andres Kwan on 5/30/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "GameResult.h"

//GameResult_ALL to namespace that constant
//to avoid conflicts with other keys "ALL is a bad name"
//this is the key that is going to be directly store in NSUserDefault
//its value is a dictionary that has other dictionaries in it.
#define ALL_RESULTS_KEY @"GameResult_All"

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

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

//convenience initializer
-(id) initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary * resultDictionary = (NSDictionary *) plist;
            _start = resultDictionary[START_KEY];
            _end   = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            if (!_start || !_end) {
                self = nil; 
            }
        }
    }
    return self;
}

- (NSTimeInterval) duration
{
    return [self.end timeIntervalSinceDate:self.start];
}


//used to write results out in the NSUserDefauls
//GameResult is not a property list, we have to turn it into.
- (void) synchronize
{
    //first TAKE IT OUT, make a mutalbe copy of it
    //how we access NSUserDefaults
    
    NSMutableDictionary *mutableGameResultsFromUserDefaults =
    [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY]mutableCopy];
    
    if (!mutableGameResultsFromUserDefaults) {
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc]init];
    }
    //Second
    //modify it
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    
    //third
    //put it back in
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    
    //fourth
    //synchronize
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)asPropertyList
{
    return @{ START_KEY : self.start, END_KEY : self.end, SCORE_KEY: @(self.score)};
}
- (void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

+ (NSArray *) allGameResults
{
    
    NSMutableArray *allGameResults = [[NSMutableArray alloc]init];
    
    //iterate over all the values of the dictionary that stores our game data
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        
        //instantiate a gameResult obj 
        GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
        
    }
    return allGameResults;
}


@end
