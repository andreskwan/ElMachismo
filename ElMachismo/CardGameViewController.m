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
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//weak because this is displayed, this class do not control it
//is strong by the view
@property (weak, nonatomic) IBOutlet UILabel  *flipsLabel;
//counts flips
@property (nonatomic)int                       flipcount;

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end



@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck]];
    return _game;
}

#pragma mark deck methods
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (void) updateUI
{
    for (UIButton * cardButton in self.cardButtons) {
        //here is where I associate the model with the view of a card
        
        //here I take the index of each cardButton
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        //here I take a card from the model and associate it with a button
        //using the index
        
        //I should leave them face down
        
        Card * cardAtIndex = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:cardAtIndex]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:cardAtIndex]
                              forState:UIControlStateNormal];
        //but what about the chosen and matched ones?
        //matched ones should have an state
        //i believe that should be used  and if to distinguish
        //from matched to the rest
        cardButton.enabled = !cardAtIndex.isMatched;
        //cardButton is a local variable, that represents a button
        // so when I set its value I'm setting the button itself!!!
        // because it is a pointer to the object
    }
    
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed: card.isChosen ? @"cardfront" : @"cardBack"];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    //how does the value of the cardButton is set?
    //first I should obtein the index value
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    //int chosenButtonAtIndex = []
    //self.flipcount++;
}


@end
