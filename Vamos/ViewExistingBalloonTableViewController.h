//
//  ViewExistingBalloonTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

@class  ViewExistingBalloonTableViewController;

@protocol ViewExistingBalloonTableViewControllerDelegate <NSObject>
- (void) ViewExistingBalloonTableViewControllerDidCancel:(ViewExistingBalloonTableViewController *)controller;
@end



@interface ViewExistingBalloonTableViewController : UITableViewController<FBFriendPickerDelegate>
{
    PFObject *balloon;
}
- (IBAction)buttonCancel:(id)sender;

@property (nonatomic, weak) id <ViewExistingBalloonTableViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *labelWhat;
@property (strong, nonatomic) PFObject *balloon;


@end
