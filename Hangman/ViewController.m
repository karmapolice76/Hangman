//
//  ViewController.m
//  Hangman
//
//  Created by Jaweed Saleem on 29/05/13.
//  Copyright (c) 2013 Jaweed Saleem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize hangmanImage;
@synthesize hangmanWordLabel;
@synthesize correctWord;
@synthesize wrongLetters;

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self checkHangmanLetter:string];
    [textField resignFirstResponder];
    
    return NO;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void) checkHangmanLetter: (NSString *) letterToCheck {
    bool match = NO;
    
    NSRange hangmanLetterRange;
    char charToCheck = [letterToCheck characterAtIndex:0];
    for (int i = 0; i < self.correctWord.length; i++) {
        char tempString = [self.correctWord characterAtIndex:i];
        
        if (charToCheck == tempString) {
            match = YES;
            hangmanLetterRange = NSMakeRange(i, 1); //location, length
            
            self.hangmanWordLabel.text = [self.hangmanWordLabel.text
                                          stringByReplacingCharactersInRange:hangmanLetterRange withString:letterToCheck];
        }
    }
    
    if (match == NO) {
        self.wrongLetters = [self.wrongLetters stringByReplacingOccurrencesOfString:letterToCheck withString:@""];
        self.wrongLetters = [self.wrongLetters stringByAppendingString:letterToCheck];
        
        int numWrong = self.wrongLetters.length;
        NSString *imageName = [NSString stringWithFormat:@"Hangman%i", numWrong];
        
        if ((numWrong >= 1) && (numWrong <= 6)) {
            self.hangmanImage.image = [UIImage imageNamed:imageName];
        } else {
            [self setupHangmanWord:self.correctWord];
            numWrong = 0;
        }
    }
}

- (void) setupHangmanWord: (NSString *) hangmanWord {
    self.wrongLetters = @"";
    self.hangmanWordLabel.text = @"";
    self.hangmanImage.image = [UIImage imageNamed:@"Hangman0"];
    
    for (int i = 0; i < hangmanWord.length; i++) {
        self.hangmanWordLabel.text = [self.hangmanWordLabel.text stringByAppendingString:@"-"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.correctWord = @"colorado";
    [self setupHangmanWord:self.correctWord];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
