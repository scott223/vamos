//
//  NewBalloonTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewBalloonTableViewController : UITableViewController 
-(IBAction)start:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textf;

@property (weak, nonatomic) IBOutlet UILabel *lab;

- (IBAction)sub:(id)sender;
- (IBAction)returnkeyButton:(id)sender;

@end
