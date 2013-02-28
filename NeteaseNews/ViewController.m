//
//  ViewController.m
//  NeteaseNews
//
//  Created by rongfzh on 13-2-25.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0,
                             self.view.frame.size.width,
                             self.view.frame.size.height);
    NSLog(@"w:%f, h:%f", rect.size.width, rect.size.height);
    UIImageView *imageleft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left.png"]];
    imageleft.frame = rect;
    [self.view addSubview:imageleft];
    
    UIView *contentView = [[UIView alloc] initWithFrame:rect];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index.png"]];
    imageView.frame = rect;
    [contentView addSubview:imageView];

    CustomView *customView = [[CustomView alloc] initWithView:contentView
                                                   parentView:self.view];
    [[customView layer] setShadowOffset:CGSizeMake(10, 10)];
    [[customView layer] setShadowRadius:20];
    [[customView layer] setShadowOpacity:1];
    [[customView layer] setShadowColor:[UIColor blackColor].CGColor];
    
    [self.view addSubview:customView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
