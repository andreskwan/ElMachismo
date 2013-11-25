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
#import "PlayingCard.h"

@interface CardGameViewController ()
//weak because this is displayed, this class do not control it
//is strong by the view
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//counts flips
@property (nonatomic)int                     flipcount;

@property (strong, nonatomic) Deck           * deck;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;

@end

@implementation CardGameViewController

- (void) setFlipcount:(int)flipcount
{
    _flipcount = flipcount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipcount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSInteger cardsLeftInDeck = 96;
    
    if (cardsLeftInDeck - self.flipcount) {
        //if non zero front is showing
        if ([sender.currentTitle length])
        {
            UIImage * cardImage = [UIImage imageNamed:@"cardback"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        }else{
            UIImage * cardImage = [UIImage imageNamed:@"cardfront"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle:[[self.deck drawRandomCard] contents]
                    forState:UIControlStateNormal];
        }
        self.flipcount++;
    }else{
        UIImage * cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
}

#pragma mark deck methods
- (Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc]init];
    return _deck;
    
}
@end
