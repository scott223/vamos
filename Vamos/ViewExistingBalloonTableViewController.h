//
//  ViewExistingBalloonTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

@interface ViewExistingBalloonTableViewController : UITableViewController {
    PFObject *balloon;
}
- (IBAction)buttonCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelWhat;
@property (strong, nonatomic) PFObject *balloon;

@end
