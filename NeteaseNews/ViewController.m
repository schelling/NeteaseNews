//
//  ViewController.m
//  NeteaseNews
//
//  Created by rongfzh on 13-2-25.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "DetailView.h"
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
    
    //添加详情页,设置到左侧不可见区域
    UIImageView *imageDetailView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"detail.png"]];
    imageDetailView.frame = rect;
    detailView = [[DetailView alloc] initWithView:imageDetailView parentView:self.view];
    detailView.center = CGPointMake(480, 230);
    
    [[detailView layer] setShadowOffset:CGSizeMake(10, 10)];
    [[detailView layer] setShadowRadius:20];
    [[detailView layer] setShadowOpacity:1];
    [[detailView layer] setShadowColor:[UIColor blackColor].CGColor];
     [self.view addSubview:detailView];

    
    UIView *contentView = [[UIView alloc] initWithFrame:rect];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index.png"]];
    imageView.frame = rect;
    UIButton *goDetailPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goDetailPageBtn.frame = CGRectMake(0, 230, 320, 70);
    [goDetailPageBtn addTarget:self
                        action:@selector(goDetailPage:)
              forControlEvents:UIControlEventTouchUpInside];

    [contentView addSubview:imageView];
    [contentView addSubview:goDetailPageBtn];
    
    CustomView *customView = [[CustomView alloc] initWithView:contentView
                                                   parentView:self.view];
    [[customView layer] setShadowOffset:CGSizeMake(10, 10)];
    [[customView layer] setShadowRadius:20];
    [[customView layer] setShadowOpacity:1];
    [[customView layer] setShadowColor:[UIColor blackColor].CGColor];
    
    [self.view addSubview:customView];
}

- (void)goDetailPage:(id)sender
{
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
    [UIView animateWithDuration:0.4
                     animations:^(void){
                          detailView.center = CGPointMake(160, 230);
                     }
                     completion:^(BOOL finish){
                         //动画完成时，可以从网络加载内容到detailView。
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
