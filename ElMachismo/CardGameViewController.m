//
//  machismoViewController.m
//  ElMachismo
//
//  Created by Andres Kwan on 4/22/13.
//  Copyright (c) 2013 com.stanfor. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//weak because this is displayed, this class do not control it
//is strong by the view
@property (weak, nonatomic) IBOutlet UILabel                        *flipsLabel;
//counts flips
@property (nonatomic)int                                            flipcount;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray  *cardButtons;



//it's very frequent to have a property that points to the model
@property (strong, nonatomic) CardMatchingGame                      *game;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    //no strong pointer to the deck, is just needed to take the playing cards, no more
    if (_game) _game = [[CardMatchingGame alloc] initWIthCardCount:[self.cardButtons count]
                                                         usingDeck:[[PlayingCardDeck alloc]init]];
}

- (void)updateUI
{
    
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    //common method, used to make the view, match the model. 
    [self updateUI];
    
}
- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipcount++;
}

- (void)setFlipcount:(int)flipcount
{
    _flipcount = flipcount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipcount];
}

@end