//
//  ViewExistingBalloonTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewExistingBalloonTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *labelWhat;
@property (weak, nonatomic) IBOutlet UILabel *labelWhere;
@property (weak, nonatomic) IBOutlet UILabel *labelWhen;

@end
