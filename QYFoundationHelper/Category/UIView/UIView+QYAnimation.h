//
//  UIView+QYAnimation.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/4/5.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QYAnimation)<CAAnimationDelegate>

- (void)moveToPoint:(CGPoint)point duration:(double) duration;

- (void)moveWithDuration:(double)duration afterTime:(double)time path:(void(^)(UIBezierPath ** path)) pathBlock;
@end
