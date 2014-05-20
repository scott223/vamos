//
//  AnimatieControllerViewController.h
//  Vamos
//
//  Created by Ferdinand on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface AnimatieControllerViewController : UIViewController {
    IBOutlet UIImageView *animation;
    
    SystemSoundID PlaySoundID;
}
-(IBAction)PlayAudio:(id)sender;
- (IBAction)Vamos:(id)sender;
- (IBAction)buttonWhoPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *aantal;

@end
