//
//  AnimatieControllerViewController.m
//  Vamos
//
//  Created by Ferdinand on 16-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "AnimatieControllerViewController.h"

@interface AnimatieControllerViewController ()

@end

@implementation AnimatieControllerViewController



- (void)viewDidLoad

{
    animation.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"A1.png"],
                                 [UIImage imageNamed:@"A2.png"],
                                 [UIImage imageNamed:@"A3.png"],
                                 [UIImage imageNamed:@"A4.png"],
                                 [UIImage imageNamed:@"A5.png"],
                                 [UIImage imageNamed:@"A6.png"],
                                 [UIImage imageNamed:@"A7.png"],
                                 [UIImage imageNamed:@"A8.png"],
                                 [UIImage imageNamed:@"A9.png"],
                                 [UIImage imageNamed:@"A10.png"],
                                 [UIImage imageNamed:@"A11.png"],
                                 [UIImage imageNamed:@"A12.png"],
                                 [UIImage imageNamed:@"A13.png"],
                                 [UIImage imageNamed:@"A14.png"],
                                 [UIImage imageNamed:@"A15.png"],
                                 [UIImage imageNamed:@"A16.png"],
                                 [UIImage imageNamed:@"A17.png"],
                                 [UIImage imageNamed:@"A18.png"],
                                 [UIImage imageNamed:@"A19.png"],
                                 [UIImage imageNamed:@"A20.png"],
                                 [UIImage imageNamed:@"A21.png"],
                                 [UIImage imageNamed:@"A22.png"],
                                 [UIImage imageNamed:@"A23.png"],nil];
    [animation setAnimationRepeatCount:1];
    [animation setAnimationDuration : 4];
    animation.image = [UIImage imageNamed:@"A23.png"];
    [animation startAnimating];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
