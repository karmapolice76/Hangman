//
//  ViewController.h
//  Hangman
//
//  Created by Jaweed Saleem on 29/05/13.
//  Copyright (c) 2013 Jaweed Saleem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UIImageView *hangmanImage;
@property (nonatomic, retain) IBOutlet UILabel *hangmanWordLabel;

@property (nonatomic, retain) NSString *correctWord;
@property (nonatomic, retain) NSString *wrongLetters;


- (void) checkHangmanLetter: (NSString *) letterToCheck;
- (void) setupHangmanWord: (NSString *) hangmanWord;

@end
