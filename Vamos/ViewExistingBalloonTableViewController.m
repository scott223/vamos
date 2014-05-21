//
//  ViewExistingBalloonTableViewController.m
//  Vamos
//
//  Created by Scott Brugmans on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "ViewExistingBalloonTableViewController.h"

@interface ViewExistingBalloonTableViewController ()

@end

@implementation ViewExistingBalloonTableViewController

@synthesize balloon, labelWhat, labelWhen, labelWhere, imageBoss, labelBoss, labelWho, buttonJoin;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [labelWhat setText:[balloon valueForKey:@"what"]];
    [labelWhere setText:[balloon valueForKey:@"where"]];
    [labelWhen setText:[balloon valueForKey:@"when"]];
    [labelWho setText:@"Loading..."];
    
    NSLog(@" cur user:%@ and balloon user: %@",[[PFUser currentUser] valueForKey:@"fb_id"],[balloon valueForKey:@"boss_fb_id"]);
    
    if ([[balloon valueForKey:@"boss_fb_id"] isEqualToString:[[PFUser currentUser] valueForKey:@"fb_id"]]) {
        [buttonJoin setHidden:YES];
        NSLog(@"wha");
    }
    
    NSString *url = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [balloon objectForKey:@"boss_fb_id"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *profilePic = [UIImage imageWithData:imageData];
    
    [imageBoss setImage:profilePic];
    [labelBoss setText:[[balloon valueForKey:@"boss"] valueForKey:@"full_name"]];
    
    PFQuery *invites = [PFUser query];
    [invites whereKey:@"fb_id" containedIn:[balloon objectForKey:@"invitedFriends"]];
    
    [invites findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d friends.", objects.count);
            NSInteger count = 0;
            NSString * tekst = [[NSString alloc] init];
            for (PFObject * obj in objects) {
                
                count++;
                NSArray *name = [[NSArray alloc] init];
                name = [[obj objectForKey:@"full_name"] componentsSeparatedByString:@" "];
                tekst = [tekst stringByAppendingFormat:@"%@", [name objectAtIndex:0]];
                if ([objects count] > count) {
                    [tekst stringByAppendingString:@", "];
                }
                
            }
            
            [labelWho setText:tekst];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        
        
    }
}
- (IBAction)buttonJoinPressed:(id)sender {
    
    NSMutableArray *responses = [balloon objectForKey:@"responses"];
    [responses addObject:@"lala"];
    [balloon setObject:responses forKey:@"responses"];
    [balloon saveInBackground];
}
@end
