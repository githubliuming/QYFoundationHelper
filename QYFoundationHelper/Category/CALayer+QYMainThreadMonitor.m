//
//  CALayer+QYMainThreadMonitor.m
//  QYViewThreadMonitor
//
//  Created by liuming on 2017/1/11.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "CALayer+QYMainThreadMonitor.h"
#import "QYSwizzleHelper.h"
@implementation CALayer (QYMainThreadMonitor)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [QYSwizzleHelper swizzleMethods:[self class]
                       originalSelector:@selector(setNeedsDisplayInRect:)
                       swizzledSelector:@selector(qy_setNeedsDisplayInRect:)];
        [QYSwizzleHelper swizzleMethods:[self class]
                       originalSelector:@selector(drawInContext:)
                       swizzledSelector:@selector(qy_drawInContext:)];
        [QYSwizzleHelper swizzleMethods:[self class]
                       originalSelector:@selector(layoutSublayers)
                       swizzledSelector:@selector(qy_layoutSublayers)];
    });
}

- (void)qy_setNeedsDisplayInRect:(CGRect)r
{
    NSAssert([NSThread isMainThread], @"[error!!! layer not in mainThread display");
    [self qy_setNeedsDisplayInRect:r];
}

- (void)qy_layoutSublayers
{
    NSAssert([NSThread isMainThread], @"[error!!! layer not in mainThread display");
    [self qy_layoutSublayers];
}
- (void)qy_drawInContext:(CGContextRef)ctx
{
    NSAssert([NSThread isMainThread], @"[error!!! layer not in mainThread display");
    [self qy_drawInContext:ctx];
}
@end

