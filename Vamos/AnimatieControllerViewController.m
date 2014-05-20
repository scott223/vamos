//
//  AnimatieControllerViewController.m
//  Vamos
//
//  Created by Ferdinand on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "AnimatieControllerViewController.h"
#import "FacebookSDK/FacebookSDK.h"
#import "KNMultiItemSelector.h"
#import "Parse/Parse.h"

@interface AnimatieControllerViewController ()

@end

@implementation AnimatieControllerViewController

<<<<<<< HEAD
=======
@synthesize invitedFriends, selector, textFieldWho, textFieldWhat;

>>>>>>> FETCH_HEAD
- (void)viewDidLoad

{
   
    
    
    
    animation.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"A1.png"],
                                 [UIImage imageNamed:@"A2.png"],
                                 [UIImage imageNamed:@"A3.png"],
                                 [UIImage imageNamed:@"A4.png"],
                                 [UIImage imageNamed:@"A5.png"],
                                 [UIImage imageNamed:@"A6.png"],
                                 [UIImage imageNamed:@"A7.png"],
                                 [UIImage imageNamed:@"A8.png"],
                                 [UIImage imageNamed:@"A9.png"],
                                 [UIImage imageNamed:@"A10.png"],
                                 [UIImage imageNamed:@"A11.png"],
                                 [UIImage imageNamed:@"A12.png"],
                                 [UIImage imageNamed:@"A13.png"],
                                 [UIImage imageNamed:@"A14.png"],
                                 [UIImage imageNamed:@"A15.png"],
                                 [UIImage imageNamed:@"A16.png"],
                                 [UIImage imageNamed:@"A17.png"],
                                 [UIImage imageNamed:@"A18.png"],
                                 [UIImage imageNamed:@"A19.png"],
                                 [UIImage imageNamed:@"A20.png"],
                                 [UIImage imageNamed:@"A21.png"],
                                 [UIImage imageNamed:@"A22.png"],
                                 [UIImage imageNamed:@"A23.png"],nil];
    [animation setAnimationRepeatCount:1];
    [animation setAnimationDuration : 4];
    animation.image = [UIImage imageNamed:@"A23.png"];
    
    friends = [NSMutableArray array];
    
    if ([friends count] == 0) {
    
    [FBRequestConnection startWithGraphPath:@"me?fields=friends"
                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                              if (!error) {
                                  NSDictionary * rawObject = result;
                                  NSDictionary * friendsArray = [rawObject objectForKey:@"friends"];
                                  NSArray * dataArray = [friendsArray objectForKey:@"data"];
                                  for (NSDictionary * f in dataArray) {
                                      NSLog(@"hey");
                                      [friends addObject:[[KNSelectorItem alloc] initWithDisplayValue:[f objectForKey:@"name"]
                                                                                          selectValue:[f objectForKey:@"id"]
                                                                                             imageUrl:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [f objectForKey:@"id"]]]];
                                  }
                                  [friends sortUsingSelector:@selector(compareByDisplayValue:)];
                                  
                                  KNMultiItemSelector * _selector = [[KNMultiItemSelector alloc] initWithItems:friends
                                                                                             preselectedItems:nil
                                                                                                        title:@"Select friends"
                                                                                              placeholderText:@"Search by name"
                                                                                                     delegate:self];
                                  
                                  _selector.allowSearchControl = YES;
                                  _selector.useTableIndex      = YES;
                                  _selector.useRecentItems     = YES;
                                  _selector.maxNumberOfRecentItems = 8;
                                  
                                  selector = _selector;

                              } else {
                                  // An error occurred, we need to handle the error
                                  // See: https://developers.facebook.com/docs/ios/errors
                              }
                          }];
        
    }
    
    invitedFriends = [[NSMutableArray alloc] init];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    textFieldWhat.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)Vamos:(id)sender {
    
<<<<<<< HEAD
   NSURL *SoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Test" ofType:@"wav"]];
    
   AudioServicesCreateSystemSoundID((__bridge CFURLRef)SoundURL, &PlaySoundID);

    AudioServicesPlaySystemSound(PlaySoundID);

=======
    [animation startAnimating];
    
    selector = [[KNMultiItemSelector alloc] initWithItems:friends
                              preselectedItems:nil
                                         title:@"Select friends"
                               placeholderText:@"Search by name"
                                      delegate:self];
    PFObject *balloon = [PFObject objectWithClassName:@"Balloon"];
    [balloon setObject:[textFieldWhat text] forKey:@"what"];
    [balloon setObject:[PFUser currentUser] forKey:@"boss"];
    [balloon setObject:[[PFUser currentUser] objectForKey:@"fb_id"] forKey:@"boss_fb_id"];
    [balloon setObject:invitedFriends forKey:@"invitedFriends"];
    
    [balloon saveInBackground];
    
    

    
>>>>>>> FETCH_HEAD
}


- (IBAction)buttonWhoPressed:(id)sender {
    
    
    [self.navigationController pushViewController:selector animated:YES];

}

#pragma mark - Handle delegate callback

-(void)selectorDidCancelSelection {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)selector:(KNMultiItemSelector *)selector didFinishSelectionWithItems:(NSArray *)selectedItems {
    /*[self dismissModalViewControllerAnimated:YES];
     if (self.popoverController) {
     [self.popoverController dismissPopoverAnimated:YES];
     self.popoverController = nil;
     }}*/
    
    [self.navigationController popViewControllerAnimated:YES];
    
    NSString *tekst = selectedItems.count ? @"" : @"None";
    int count = 0;
    [invitedFriends removeAllObjects];
    for (KNSelectorItem * i in selectedItems) {
        count++;
        NSArray *name = [[NSArray alloc] init];
        name = [i.displayValue componentsSeparatedByString:@" "];
        tekst = [tekst stringByAppendingFormat:@"%@", [name objectAtIndex:0]];
        if ([selectedItems count] > count) {
            [tekst stringByAppendingString:@", "];
        }
        [invitedFriends addObject:i.selectValue];
        
    }
    
    [textFieldWho setText:tekst];
    
}

@end
