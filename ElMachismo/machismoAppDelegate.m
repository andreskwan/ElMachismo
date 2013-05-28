//
//  machismoAppDelegate.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/22/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "machismoAppDelegate.h"
#import "Card.h"
#import "PlayingCard.h"

@implementation machismoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    
//    PlayingCard * cardA = [[PlayingCard alloc]init];
//    PlayingCard * cardB = [[PlayingCard alloc]init];
//    PlayingCard * cardC = [[PlayingCard alloc]init];
//    [cardA setSuit:@"♣"];
//    [cardB setSuit:@"♥"];
//    [cardC setSuit:@"♠"];
//    //[cardC setSuit:@"♠"];
//    [cardA setRank:10];
//    [cardB setRank:11];
//    [cardC setRank:12];

//    cardA.contents = @[cardB.contents, cardC.contents][[cardB match:@[cardC]] ? 1 : 0];
//    
//    NSLog(@"[[cardB match:@[cardC]] ? 1 : 0] : %@",@[cardA.contents, cardC.contents][[cardB match:@[cardC]] ? 1 : 0]);    
//    NSLog(@"@[cardA.contents, cardB.contents][1] : %@",@[cardA.contents, cardB.contents][1]);
//    
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    NSLog(@"cardB.contents: %@",cardB.contents);
//    NSLog(@"cardC.contents: %@",cardC.contents);
//    
//    cardA.contents = @[cardB.contents, cardC.contents][0];
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    cardA.contents = cardC.contents;
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    
//    [cardA setContents:@[cardB.contents, cardC.contents][0]];
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    cardA.contents = [cardB match:@[cardC]] ? cardC.contents : cardB.contents;
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    cardA.contents = @"K♥";
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    NSLog(@"[NSString stringWithFormat:@\"X\" cardB.contents]:%@",[NSString stringWithFormat:@"%@", cardB.contents]);
//    
//    cardA.contents = [NSString stringWithFormat:@"%@", cardB.contents];
//    NSLog(@"cardA.contents: %@",cardA.contents);
//    
//    [cardA setSuit:@"♥"];
//    NSLog(@"cardA.contents: %@",cardA.contents);
    
    Card * cardA = [[Card alloc]init];
    Card * cardB = [[Card alloc]init];
    Card * cardC = [[Card alloc]init];
    
    [cardA setContents:@"mama"];
    [cardB setContents:@"daniela"];
    [cardC setContents:@"daniela"];

    [cardA setContents:[NSString stringWithFormat:@"%@", cardB.contents]];
    cardA.contents = @[cardB.contents, cardC.contents][[cardB match:@[cardC]] ? 1 : 0];
    NSLog(@"cardA.contents: %@",cardA.contents);
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
