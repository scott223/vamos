//
//  CustomButton.m
//  Vamos
//
//  Created by Ferdinand on 15-05-14.
//  Copyright (c) 2014 Scott Brugmans. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor colorWithRed:0.114 green:0.11 blue:1 alpha: 1];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, self.bounds);
}

@end
