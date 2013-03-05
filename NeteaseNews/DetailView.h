//
//  DetailView.h
//  NeteaseNews
//
//  Created by rongfzh on 13-3-5.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentView;

@interface DetailView : UIView
{
    CommentView *commentView;
    BOOL isPanComment;
}
- (id)initWithView:(UIView*)contentView parentView:(UIView*) parentView;

@property (nonatomic, strong) UIView *parentView; //抽屉视图的父视图
@property (nonatomic, strong) UIView *contentView; //抽屉显示内容的视图
@end
