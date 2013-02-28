//
//  CustomView.h
//  NeteaseNews
//
//  Created by rongfzh on 13-2-25.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
{
    CGPoint openPointCenter;
    CGPoint closePointCenter;
}
-(id)initWithView:(UIView*)contentview parentView:(UIView*) parentview;

@property (nonatomic, strong) UIView *parentView; //抽屉视图的父视图
@property (nonatomic, strong) UIView *contenView; //抽屉显示内容的视图
@end
