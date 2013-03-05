//
//  DetailView.m
//  NeteaseNews
//
//  Created by rongfzh on 13-3-5.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import "DetailView.h"
#import "CommentView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithView:(UIView *)contentView parentView:(UIView *)parentView{
    
    self = [super initWithFrame:CGRectMake(0,0,contentView.frame.size.width, contentView.frame.size.height)];
    if (self) {
        [self addSubview:contentView];
        UIPanGestureRecognizer *panGestureRecognier = [[UIPanGestureRecognizer alloc]
                                                       initWithTarget:self
                                                       action:@selector(HandlePan:)];
        [self addGestureRecognizer:panGestureRecognier];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, 80, 50);
        [backBtn addTarget:self
                    action:@selector(back:)
          forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];

        UIImageView *imageCommentView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"comment.png"]];
        imageCommentView.frame  = CGRectMake(0, 0,
                                                    self.frame.size.width,
                                                    self.frame.size.height);
        commentView = [[CommentView alloc] initWithView:imageCommentView parentView:self];
        commentView.center = CGPointMake(480, 230);
        [[commentView layer] setShadowOffset:CGSizeMake(10, 10)];
        [[commentView layer] setShadowRadius:20];
        [[commentView layer] setShadowOpacity:1];
        [[commentView layer] setShadowColor:[UIColor blackColor].CGColor];
        [self addSubview:commentView];
        isPanComment = NO;
        
    }
    
    self.parentView = parentView;
    return self;
}


- (void)HandlePan:(UIPanGestureRecognizer*)panGestureRecognizer{
    
    CGPoint translation = [panGestureRecognizer translationInView:self.parentView];
    float x = self.center.x + translation.x;
    if (x < 160) {
        x = 160;
    }

    if(translation.x > 0){
        if (!isPanComment) {
            self.center = CGPointMake(x, 230);
        }
    }
    
    if (translation.x < 0 && self.center.x > 160) {
        if (!isPanComment) {
            self.center = CGPointMake(x, 230);
        }
    }else if(translation.x < 0){
        isPanComment = YES;
        commentView.center = CGPointMake(commentView.center.x + translation.x, 230);
    }

    if (commentView.center.x < 480 && translation.x > 0) {
        isPanComment = YES;
        commentView.center = CGPointMake(commentView.center.x + translation.x, 230);
    }
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (commentView.center.x < 400) {
            [UIView animateWithDuration:0.4
                                  delay:0.1
                                options:UIViewAnimationCurveEaseInOut
                             animations:^(void){
                                 commentView.center = CGPointMake(160, 230);
                             }completion:^(BOOL finish){
                                 isPanComment = NO;
                             }];
        }else{
            [UIView animateWithDuration:0.4
                                  delay:0.1
                                options:UIViewAnimationCurveEaseInOut
                             animations:^(void){
                                 commentView.center = CGPointMake(480, 230);
                             }completion:^(BOOL finish){
                                 isPanComment = NO;
                             }];
        }
        if (self.center.x > 190) {
            [UIView animateWithDuration:0.4
                                  delay:0.1
                                options:UIViewAnimationCurveEaseInOut
                             animations:^(void){
                                 self.center = CGPointMake(480, 230);
                             }completion:^(BOOL finish){
                                 [self.parentView exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
                             }];
        }else{
            [UIView animateWithDuration:0.4
                                  delay:0.1
                                options:UIViewAnimationCurveEaseInOut
                             animations:^(void){
                                 self.center = CGPointMake(160, 230);
                             }completion:^(BOOL finish){
                                 
                             }];

        }

    }
    
    [panGestureRecognizer setTranslation:CGPointZero inView:self.parentView];
    
}

- (void) back:(id)sender{
    [UIView animateWithDuration:0.4
                          delay:0.1
                        options:UIViewAnimationCurveEaseInOut
                     animations:^(void){
                         self.center = CGPointMake(480, 230);
                     }completion:^(BOOL finish){
                         [self.parentView exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
