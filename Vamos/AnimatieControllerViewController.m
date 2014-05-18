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
                                 [UIImage imageNamed:@"animatie1.png"],
                                 [UIImage imageNamed:@"animatie2.png"],
                                 [UIImage imageNamed:@"animatie3.png"],
                                 [UIImage imageNamed:@"animatie4.png"],
                                 [UIImage imageNamed:@"animatie5.png"],
                                 [UIImage imageNamed:@"animatie6.png"],
                                 [UIImage imageNamed:@"animatie7.png"],
                                 [UIImage imageNamed:@"animatie8.png"],
                                 [UIImage imageNamed:@"animatie9.png"],
                                 [UIImage imageNamed:@"animatie10.png"],
                                 [UIImage imageNamed:@"animatie11.png"],
                                 [UIImage imageNamed:@"animatie12.png"],
                                 [UIImage imageNamed:@"animatie13.png"],
                                 [UIImage imageNamed:@"animatie12.png"],
                                 [UIImage imageNamed:@"animatie11.png"],
                                 [UIImage imageNamed:@"animatie13.png"],
                                 [UIImage imageNamed:@"animatie11.png"],
                                 [UIImage imageNamed:@"animatie13.png"],nil];
    [animation setAnimationRepeatCount:1];
    [animation setAnimationDuration : 10];
    [animation startAnimating];
    /*[animation performSelector:@selector(setImage:) withObject:@"animatie13.png" afterDelay:[animation animationDuration]];
    */
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
