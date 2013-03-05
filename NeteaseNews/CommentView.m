//
//  CommentView.m
//  NeteaseNews
//
//  Created by rongfzh on 13-3-5.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import "CommentView.h"

@implementation CommentView

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
        self.center = CGPointMake(x, 230);
    }
    
    if (translation.x < 0 && self.center.x > 160) {
        self.center = CGPointMake(x, 230);
    }else{
        
    }
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (self.center.x > 190) {
            [UIView animateWithDuration:0.4
                                  delay:0.1
                                options:UIViewAnimationCurveEaseInOut
                             animations:^(void){
                                 self.center = CGPointMake(480, 230);
                             }completion:^(BOOL finish){
//                                 [self.parentView exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
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
//                         [self.parentView exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
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
