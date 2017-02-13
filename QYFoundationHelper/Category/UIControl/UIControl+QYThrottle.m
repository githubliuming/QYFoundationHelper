//
//  UIControl+QYThrottle.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/10.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "UIControl+QYThrottle.h"
#import "QYSwizzleHelper.h"
#import <objc/runtime.h>
@interface UIControl ()

@property(nonatomic, strong)
    NSMutableDictionary* eventThrottleDic;  ///<* 记录方法throttle的方法状态 YES，允许状态 NO 禁止状态
@property(nonatomic, strong) NSMutableDictionary* eventDic;  ///<* 记录需要throttle的方法
@end
@implementation UIControl (QYThrottle)

- (void)setEventThrottleDic:(NSMutableDictionary*)eventThrottleDic
{
    objc_setAssociatedObject(self, @selector(eventThrottleDic), eventThrottleDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary*)eventThrottleDic
{
    NSMutableDictionary* dic = objc_getAssociatedObject(self, _cmd);

    if (dic == nil)
    {
        dic = [[NSMutableDictionary alloc] init];
        [self setEventThrottleDic:dic];
    }
    return dic;
}

- (void)setEventDic:(NSMutableDictionary*)eventDic
{
    objc_setAssociatedObject(self, @selector(eventDic), eventDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary*)eventDic
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    if (dic == nil)
    {
        dic = [[NSMutableDictionary alloc] init];
        [self setEventDic:dic];
    }

    return dic;
}

- (void)addTarget:(id)target
              action:(SEL)action
    forControlEvents:(UIControlEvents)controlEvents
        withThrottle:(double)throttle
{
    if (throttle > 0)
    {
        NSString* actionName = NSStringFromSelector(action);
        [self.eventThrottleDic setObject:@(YES) forKey:actionName];
        [self.eventDic setObject:@(throttle) forKey:actionName];
    }

    [self addTarget:target action:action forControlEvents:controlEvents];
}

+ (void)load
{
    SEL oringe = @selector(sendAction:to:forEvent:);
    SEL swizzleMethod = @selector(qy_sendAction:to:forEvent:);
    [QYSwizzleHelper swizzleMethods:[self class] originalSelector:oringe swizzledSelector:swizzleMethod];
}

- (void)qy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event
{
    NSString* actionName = NSStringFromSelector(action);
    double throttle = [[self.eventThrottleDic objectForKey:actionName] doubleValue];
    if (throttle > 0)
    {
        BOOL statue = [[self.eventDic objectForKey:actionName] boolValue];
        if (!statue)
        {
            return;
        }
        [self lockSelector:actionName];
        [self qy_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(unlockSelector:) withObject:actionName afterDelay:throttle];
    }
    else
    {
        [self qy_sendAction:action to:target forEvent:event];
    }
}

- (void)lockSelector:(NSString*)selectorAsString { [self.eventThrottleDic setObject:@(NO) forKey:selectorAsString]; }
- (void)unlockSelector:(NSString*)selectorAsString { [self.eventThrottleDic setObject:@(YES) forKey:selectorAsString]; }
@end

