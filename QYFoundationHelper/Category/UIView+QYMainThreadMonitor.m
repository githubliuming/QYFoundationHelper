//
//  UIView+QYMainThreadMonitor.m
//  QYViewThreadMonitor
//
//  Created by liuming on 2017/1/11.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "UIView+QYMainThreadMonitor.h"
#import "QYSwizzleHelper.h"
#import <objc/runtime.h>
@implementation UIView (QYMainThreadMonitor)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [QYSwizzleHelper swizzleMethods:[self class]
                       originalSelector:@selector(setNeedsLayout)
                       swizzledSelector:@selector(qy_setNeedsLayout)];
        [QYSwizzleHelper swizzleMethods:[self class]
                       originalSelector:@selector(setNeedsDisplay)
                       swizzledSelector:@selector(qy_setNeedsDisplay)];
    });
}

- (void)qy_setNeedsLayout
{
    NSAssert([NSThread isMainThread], @"【error!!! view is not in mainThread Render】");
    [self qy_setNeedsLayout];
}

- (void)qy_setNeedsDisplay
{
    NSAssert([NSThread isMainThread], @"【error!!! view is not in mainThread Render】");
    [self qy_setNeedsDisplay];
}
@end

