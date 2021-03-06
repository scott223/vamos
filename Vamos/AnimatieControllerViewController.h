//
//  AnimatieControllerViewController.h
//  Vamos
//
//  Created by Ferdinand on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


#import "KNMultiItemSelector.h"

@interface AnimatieControllerViewController : UIViewController <KNMultiItemSelectorDelegate, UITextFieldDelegate> {
    
    SystemSoundID PlaySoundID;
    
    IBOutlet UIImageView *animation;
    
    NSMutableArray * friends;
    KNMultiItemSelector *selector;
    
}

- (IBAction)buttonVamosPressed:(id)sender;
- (IBAction)buttonWhoPressed:(id)sender;
- (IBAction)textFieldWhoPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textFieldWhat;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWho;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhen;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhere;

@property (retain, nonatomic) KNMultiItemSelector *selector;

@property (weak, nonatomic) IBOutlet UITextField *aantal;

@property (retain, nonatomic) NSMutableArray *invitedFriends;


@end
