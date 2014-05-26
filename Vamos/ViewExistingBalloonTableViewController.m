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

@synthesize balloon, friends, buttonJoin;

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
    
    //[labelWhat setText:[balloon valueForKey:@"what"]];
    //[labelWhere setText:[balloon valueForKey:@"where"]];
    //[labelWhen setText:[balloon valueForKey:@"when"]];

    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"List" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(ViewExistingBalloonTableViewControllerDidCancel)];
    self.navigationItem.leftBarButtonItem = left;
    
    if ([[balloon objectForKey:@"boss_fb_id"] isEqualToString:[[PFUser currentUser] objectForKey:@"fb_id"]]) {
        buttonJoin.hidden = YES;
    } else {
        buttonJoin.hidden = NO;
    }


    //
    
    [self updateResponses];
    
}

- (void)updateResponses
{

    
    PFQuery *invites = [PFUser query];
    [invites whereKey:@"fb_id" containedIn:[balloon objectForKey:@"responses"]];
    
    [invites findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d friends.", objects.count);
            NSMutableArray * _friends = [[NSMutableArray alloc]init];
            [friends removeAllObjects];

            for (PFObject * obj in objects) {
                
                NSMutableArray *fr = [[NSMutableArray alloc]init];
                [fr addObject:[obj objectForKey:@"fb_id"]];
                [fr addObject:[obj objectForKey:@"full_name"]];
                
                [_friends addObject:fr];
            }
            
            friends = _friends;
            
            [self.tableView reloadData];
            
            if ([[balloon objectForKey:@"responses"] containsObject:[[PFUser currentUser] objectForKey:@"fb_id"]]) {
                [buttonJoin setTitle:@"UNJOIN" forState:UIControlStateNormal];
            } else {
                [buttonJoin setTitle:@"JOIN!!!" forState:UIControlStateNormal];
            }
            
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([friends count] > 0)
    {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return 4;
    } else {
        return [friends count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Balloon";
            break;
        case 1:
            sectionName = @"Joining friends";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"balloonInfoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //5.1 you do not need this if you have set SettingsCell as identifier in the storyboard (else you can remove the comments on this code)
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        //NSLog(@"deque");
    }
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
                
                NSString *url = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [balloon objectForKey:@"boss_fb_id"]];
                
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                UIImage *profilePic = [UIImage imageWithData:imageData];
                
                cell.imageView.image = profilePic;
                [cell.textLabel setText:[[balloon valueForKey:@"boss"] valueForKey:@"full_name"]];
                
        } else if (indexPath.row == 1) {
     
                [cell.textLabel setText:[balloon objectForKey:@"what"]];
        } else if (indexPath.row == 2) {
      
                [cell.textLabel setText:[balloon objectForKey:@"when"]];
        } else if (indexPath.row == 3) {
                [cell.textLabel setText:[balloon objectForKey:@"where"]];
        }
        
    } else {
        NSString *url = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=square", [[friends objectAtIndex:indexPath.row] objectAtIndex:0]];
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *profilePic = [UIImage imageWithData:imageData];
        cell.imageView.image = profilePic;
        

        [cell.textLabel setText:[[friends objectAtIndex:indexPath.row] objectAtIndex:1]];
    }
    
    
    
    
    return cell;
}
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
    
    if (![responses containsObject:[[PFUser currentUser] objectForKey:@"fb_id"]]) { //joining
        [responses addObject:[[PFUser currentUser] objectForKey:@"fb_id"]];
        
    } else { //unjoining
        [responses removeObject:[[PFUser currentUser] objectForKey:@"fb_id"]];
    }
    [balloon setObject:responses forKey:@"responses"];
    [balloon saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self updateResponses];
            [PFAnalytics trackEvent:@"Attendance confirmed"];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            [PFAnalytics trackEvent:@"Attendance removed"];
        }
        
    }];
    
}
@end
