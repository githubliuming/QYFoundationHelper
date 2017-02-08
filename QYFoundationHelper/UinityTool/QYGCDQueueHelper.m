//
//  QYGCDQueueHelper.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/7.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYGCDQueueHelper.h"

@implementation QYGCDQueueHelper
//创建一个线程
+ (dispatch_queue_t)creatGCDQueue:(NSString *)label style:(QYQueueStyle)style
{
    if (label == nil)
    {
        label = @"com.apple.QYFoundationHelper";
    }
    dispatch_queue_attr_t attr = style == QYQueueStyleSERIAL ? DISPATCH_QUEUE_SERIAL : DISPATCH_QUEUE_CONCURRENT;
    return dispatch_queue_create([label UTF8String], attr);
}
//获取主线程队列
+ (dispatch_queue_t)getMainQueue { return dispatch_get_main_queue(); }
//获取异步线程队列
+ (dispatch_queue_t)getGlobalQueue { return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); }
//主线程执行
+ (void)runAsyncOnMainQueue:(void (^)(void))block { [self runAsyncQueue:[self getMainQueue] complentBlock:block]; }
//异步线程执行
+ (void)runAsyncOnGlobalQueue:(void (^)(void))block { [self runAsyncQueue:[self getGlobalQueue] complentBlock:block]; }
//指队列程执行
+ (void)runAsyncQueue:(dispatch_queue_t)queue complentBlock:(void (^)(void))block { dispatch_async(queue, block); }
//指定队列下 Barrier 运行
+ (void)runBarrierAsync:(dispatch_queue_t)queue complentBlock:(void (^)(void))block
{
    dispatch_barrier_async(queue, block);
}
//指定队列同步执行
+ (void)runSyncOnQueue:(dispatch_queue_t)queue complentBlock:(void (^)(void))block { dispatch_sync(queue, block); }
@end

