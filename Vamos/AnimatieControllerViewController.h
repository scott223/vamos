//
//  AnimatieControllerViewController.h
//  Vamos
//
//  Created by Ferdinand on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
<<<<<<< HEAD

@interface AnimatieControllerViewController : UIViewController {
=======
#import "KNMultiItemSelector.h"

@interface AnimatieControllerViewController : UIViewController <KNMultiItemSelectorDelegate, UITextFieldDelegate> {
>>>>>>> FETCH_HEAD
    IBOutlet UIImageView *animation;
      NSMutableArray * friends;
    KNMultiItemSelector *selector;
    
}
<<<<<<< HEAD
-(IBAction)PlayAudioButton:(id)sender;
=======
>>>>>>> FETCH_HEAD

- (IBAction)Vamos:(id)sender;

- (IBAction)buttonWhoPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldWhat;


@property (weak, nonatomic) IBOutlet UITextField *textFieldWho;
@property (retain, nonatomic) KNMultiItemSelector *selector;

@property (weak, nonatomic) IBOutlet UITextField *aantal;

@property (retain, nonatomic) NSMutableArray *invitedFriends;


@end
