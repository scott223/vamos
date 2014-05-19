//
//  NewBalloonTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FacebookSDK.h"
#import "KNMultiItemSelector.h";

@interface NewBalloonTableViewController : UITableViewController <KNMultiItemSelectorDelegate>{
      NSMutableArray * friends;
}
-(IBAction)start:(id)sender;
- (IBAction)laatOp:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textf;

@property (weak, nonatomic) IBOutlet UILabel *lab;

- (IBAction)sub:(id)sender;
- (IBAction)returnkeyButton:(id)sender;

@property (retain, nonatomic) UISearchBar *searchBar;
@property (retain, nonatomic) NSString *searchText;
@property (retain, nonatomic) NSMutableArray *invitedFriends;


@end
