//
//  PLPendulumAnimationView.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/4/12.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "PLPendulumAnimationView.h"
#import "QYDynamicItem.h"
@interface PLPendulumAnimationView()
@property(nonatomic,strong) UIView * animationView;    //做动画的view
@property(nonatomic,strong) UIView * anchorView;       //锚点view

@property(nonatomic,strong) UIDynamicAnimator * animator;
@end
@implementation PLPendulumAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.anchorView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(frame) - 4)/2.0f, 30, 4, 4)];
        self.anchorView.layer.masksToBounds = YES;
        self.anchorView.layer.cornerRadius = 1.0f;
        self.anchorView.backgroundColor = [UIColor redColor];
        [self addSubview:self.anchorView];
        
        self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.animationView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.animationView];
        [self initAinimation];
        
    }
    return self;
}


- (void)initAinimation{

    UIDynamicAnimator * animator =   [[UIDynamicAnimator alloc] initWithReferenceView:self];
    UIGravityBehavior * behavior = [[UIGravityBehavior alloc] initWithItems:@[self.animationView]];
    [animator addBehavior:behavior];
    
    UIAttachmentBehavior * attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.animationView attachedToAnchor:CGPointMake(CGRectGetWidth(self.frame)/2.0, 0)];
    attachmentBehavior.length = 100.0f;
//    attachmentBehavior.damping = 0.0;
    attachmentBehavior.frequency = 0.3;
    [animator addBehavior:attachmentBehavior];
    self.animator =animator;
    
}

@end
