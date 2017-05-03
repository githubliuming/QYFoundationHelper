//
//  UIView+QYAnimation.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/4/5.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "UIView+QYAnimation.h"

@implementation UIView (QYAnimation)
- (void)moveToPoint:(CGPoint)point duration:(double) duration
{
    CABasicAnimation *baseAnimation = [[CABasicAnimation alloc] init];
    [baseAnimation setKeyPath:@"position"];
    baseAnimation.fromValue = [NSValue valueWithCGPoint:self.layer.position];
    baseAnimation.toValue = [NSValue valueWithCGPoint:point];
    baseAnimation.duration = duration;
    baseAnimation.repeatCount = 1;
    [baseAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    baseAnimation.removedOnCompletion = false;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.delegate = self;
    [baseAnimation setValue:[NSValue valueWithCGPoint:point] forKey:@"endPoint"];
    [baseAnimation setValue:self forKey:@"sender"];
    [self.layer addAnimation:baseAnimation forKey:@"position"];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CGPoint endPoint = [[anim valueForKey:@"endPoint"] CGPointValue];
    UIView * view = (UIView *)[anim valueForKey:@"sender"];
    view.layer.position = endPoint;
    
}

- (void)moveWithDuration:(double)duration afterTime:(double)time path:(void(^)(UIBezierPath ** path)) pathBlock{

    CAKeyframeAnimation * keyFrameAnimation = [[CAKeyframeAnimation alloc] init];
    [keyFrameAnimation setKeyPath:@"position"];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 50, 50);
    CGPathAddCurveToPoint(path, nil, 50, 50, 700, 300, 30, 50);
    keyFrameAnimation.path = path;
    keyFrameAnimation.duration = duration;
    keyFrameAnimation.beginTime = CACurrentMediaTime() + time;
    [self.layer addAnimation:keyFrameAnimation forKey:@"position"];
    
}
@end
