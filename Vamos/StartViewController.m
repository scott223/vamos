//
//  StartViewController.m
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "StartViewController.h"
#import "Parse/Parse.h"
#import <FacebookSDK/FacebookSDK.h>

@interface StartViewController ()

@end

@implementation StartViewController





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Check if user is cached and linked to Facebook, if so, bypass login

}

- (void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        
        [self performSegueWithIdentifier:@"startSegue" sender:self];
        
    }
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
 NSLog(@"prepareForSegue: %@", segue.identifier);
 if([segue.identifier isEqualToString:@"joeSegue"])
 {
 
 }else if([segue.identifier isEqualToString:@"johnSegue"]){
 
 }
}
*/

- (IBAction)startSegue:(id)sender {
    
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        
            [self performSegueWithIdentifier:@"startSegue" sender:self];
        
    } else {
        
        NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location", @"user_friends"];
        
        // Login PFUser using facebook
        [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
            
            if (!user) {
                if (!error) {
                    NSLog(@"Uh oh. The user cancelled the Facebook login.");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"Uh oh. The user cancelled the Facebook login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                    [alert show];
                } else {
                    NSLog(@"Uh oh. An error occurred: %@", error);
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                    [alert show];
                }
            } else if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
                
                // Send request to Facebook
                FBRequest *request = [FBRequest requestForMe];
                [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                    // handle response
                    if (!error) {
                        // Parse the data received
                        NSDictionary *userData = (NSDictionary *)result;
                        
                        NSString *facebookID = userData[@"id"];
                        
                        NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                        
                        NSMutableDictionary *userProfile = [NSMutableDictionary dictionaryWithCapacity:7];
                        
                        if (facebookID) {
                            userProfile[@"facebookId"] = facebookID;
                        }
                        
                        if (userData[@"name"]) {
                            userProfile[@"name"] = userData[@"name"];
                        }
                        
                        if (userData[@"location"][@"name"]) {
                            userProfile[@"location"] = userData[@"location"][@"name"];
                        }
                        
                        if (userData[@"gender"]) {
                            userProfile[@"gender"] = userData[@"gender"];
                        }
                        
                        if (userData[@"birthday"]) {
                            userProfile[@"birthday"] = userData[@"birthday"];
                        }
                        
                        if (userData[@"relationship_status"]) {
                            userProfile[@"relationship"] = userData[@"relationship_status"];
                        }
                        
                        if ([pictureURL absoluteString]) {
                            userProfile[@"pictureURL"] = [pictureURL absoluteString];
                        }
                        
                        [[PFUser currentUser] setObject:userProfile forKey:@"profile"];
                        [[PFUser currentUser] setValue:facebookID forKey:@"fb_id"];
                        [[PFUser currentUser] saveInBackground];
                        
                        NSLog(@"New user data added");
                        
                            [self performSegueWithIdentifier:@"startSegue" sender:self];
                    } else if ([[[[error userInfo] objectForKey:@"error"] objectForKey:@"type"]
                                isEqualToString: @"OAuthException"]) { // Since the request failed, we can check if it was due to an invalid session
                        NSLog(@"The facebook session was invalidated");
                    } else {
                        NSLog(@"Some other error: %@", error);
                    }
                }];
                
            } else {
                NSLog(@"User with facebook logged in!");
                    [self performSegueWithIdentifier:@"startSegue" sender:self];
            }
        }];
        
    }


}
@end
