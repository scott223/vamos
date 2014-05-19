//
//  BalloonListTableViewController.h
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewExistingBalloonTableViewController.h"

@interface BalloonListTableViewController : UITableViewController< ViewExistingBalloonTableViewControllerDelegate>{
    NSMutableArray *balloonList;
}

@property (nonatomic, strong) NSMutableArray *balloonList;



@end
