//
//  NSNotificationCenter+QYMainThread.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "NSNotificationCenter+QYMainThread.h"

@implementation NSNotificationCenter (QYMainThread)

- (void)postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject
{
    NSNotification *noti = [NSNotification notificationWithName:aName object:anObject];
    [self postNotificationOnMainThread:noti];
}
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *noti = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotificationOnMainThread:noti];
}
@end

