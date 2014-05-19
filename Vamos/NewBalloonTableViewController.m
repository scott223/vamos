//
//  NewBalloonTableViewController.m
//  Vamos
//
//  Created by Scott Brugmans on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "NewBalloonTableViewController.h"
#import "KNMultiItemSelector.h";

@interface NewBalloonTableViewController ()

@end

@implementation NewBalloonTableViewController
                                
@synthesize lab, textf, invitedFriends;

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
    
    friends = [NSMutableArray array];
    
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
                              } else {
                                  // An error occurred, we need to handle the error
                                  // See: https://developers.facebook.com/docs/ios/errors   
                              }
                          }];
    
    invitedFriends = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sub:(id)sender {
  
    NSString * input=textf.text;
    
    lab.text= input;
    
}



-(IBAction)returnkeyButton:(id)sender
{
    [sender resignFirstResponder];
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
/* (voor als we ooit nog een search bar willen!
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSSString stringWithFormat:@"http://%@",searchBar.text]]]];
    [webview addSubview:ActivityInd];
}
-(void)searchBarCancelButtonClicked: (UISearchBar *)searchBar {
    searchBar.text = nil;
    [searchBar resignFirstResponder];
}
*/

- (IBAction)laatOp:(id)sender {
    KNMultiItemSelector * selector = [[KNMultiItemSelector alloc] initWithItems:friends
                                                               preselectedItems:nil
                                                                          title:@"Select friends"
                                                                placeholderText:@"Search by name"
                                                                       delegate:self];
    
    selector.allowSearchControl = YES;
    selector.useTableIndex      = YES;
    selector.useRecentItems     = YES;
    selector.maxNumberOfRecentItems = 8;
    
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
    
    NSString *tekst = selectedItems.count ? @"You have selected:\n" : @"You have not selected any friend";
    for (KNSelectorItem * i in selectedItems) {
        tekst = [tekst stringByAppendingFormat:@"%@ - %@\n", i.selectValue, i.displayValue];
    
    }
    
    NSLog(@"%@",tekst);
}
@end
