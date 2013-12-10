//
//  machismoViewController.h
//  ElMachismo
//
//  Created by Andres Kwan on 4/22/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import <UIKit/UIKit.h>
// not tide to a specific playing card deck
#import "Deck.h"
@interface CardGameViewController : UIViewController

// protected
// for sublcasses

- (Deck *)createDeck; //abstractCardM
@end
