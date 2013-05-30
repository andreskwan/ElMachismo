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
#import "GameResult.h"

@interface CardGameViewController ()
//weak because this is displayed, this class do not control it
//is strong by the view
@property (weak, nonatomic) IBOutlet UILabel                        *flipsLabel;
//counts flips
@property (nonatomic)int                                            flipcount;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray  *cardButtons;

//MODEL - it's very frequent to have a property that points to the model
@property (strong, nonatomic) CardMatchingGame                      *game;
@property (weak, nonatomic) IBOutlet UILabel                        *scoreLabel;

@property (strong, nonatomic) GameResult                            *gameResult;
@end

@implementation CardGameViewController
- (GameResult *)gameResult
{
    if (!_gameResult) {
        _gameResult = [[GameResult alloc]init];
        
    }
    return _gameResult;
}


- (CardMatchingGame *)game
{
//    NSLog(@"[self.cardButtons count]: %d",[self.cardButtons count]);
    //no strong pointer to the deck, is just needed to take the playing cards, no more
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[[PlayingCardDeck alloc]init]];
    return _game;

}


- (void)setCardButtons:(NSArray *)cardButtons
{
    //its kind of magic hear how cardButtons are instantiated!!! Now I understand!
    _cardButtons = cardButtons;
    [self updateUI];
    
}

//common method, used to make the view, match the model.
//it has to comunicate with the model to update the view!
//common paradime
- (void)updateUI
{
    for (UIButton * cardButton in self.cardButtons) {
        //lazy instantiation of game if it is nil
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //the card did match but are not enable any more so we have to add
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", [self.game score]];
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
    self.gameResult.score = self.game.score;
}

- (IBAction)dealButton {
    self.game       = nil;
    self.gameResult = nil;
    self.flipcount  = 0;
    [self updateUI];
    //I don't need this
    //because I have lazy instantiation for
    //game property, it is used in [self updateUI]
    //[self game];
}




@end