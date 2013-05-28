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



//MODEL - it's very frequent to have a property that points to the model
@property (strong, nonatomic) CardMatchingGame                      *game;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
//    NSLog(@"[self.cardButtons count]: %d",[self.cardButtons count]);
    //no strong pointer to the deck, is just needed to take the playing cards, no more
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[[PlayingCardDeck alloc]init]];
<<<<<<< HEAD
    return _game;
=======
}

//common method, used to make the view, match the model.
//common paradime
- (void)updateUI
{
    
>>>>>>> 552110a9615ccf3c2785f1926d97a7fd1ec3c8ed
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    //its kind of magic hear how cardButtons are instantiated!!! Now I understand!
    _cardButtons = cardButtons;
<<<<<<< HEAD
=======

>>>>>>> 552110a9615ccf3c2785f1926d97a7fd1ec3c8ed
    [self updateUI];
    
}

//common method, used to make the view, match the model.
//it has to comunicate with the model to update the view!
//common paradime
- (void)updateUI
{
<<<<<<< HEAD
    for (UIButton * cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //the card did match but are not enable any more so we have to add
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
    }
    
=======
        //this is wrong, because is the model which decides wich buttons are in the selected state
    //tell my model
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    sender.selected = !sender.isSelected;
    self.flipcount++;
>>>>>>> 552110a9615ccf3c2785f1926d97a7fd1ec3c8ed
}



- (void)setFlipcount:(int)flipcount
{
    _flipcount = flipcount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipcount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    //this is wrong, because is the model which decides wich buttons are in the selected state
    //tell my model
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipcount++;
    //I have to update my ui every time I flip a card
    [self updateUI];
}



@end