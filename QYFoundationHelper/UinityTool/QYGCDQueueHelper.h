//
//  QYGCDQueueHelper.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/7.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QYQueueStyle) {
    QYQueueStyleSERIAL,        //串行队列
    QYQueueStyleCONCURRENT,    //并行队列
};
@interface QYGCDQueueHelper : NSObject

// creat a new queue
+ (dispatch_queue_t)creatGCDQueue:(NSString * )label style:(QYQueueStyle) style;

//获取主线程队列
+ (dispatch_queue_t) getMainQueue;
//获取Global队列
+ (dispatch_queue_t) getGlobalQueue;
//主线程执行
+ (void)runAsyncOnMainQueue:(void(^)(void)) block;
//异步线程执行
+ (void)runAsyncOnGlobalQueue:(void(^)(void)) block;
//指定队列执行
+ (void)runAsyncQueue:(dispatch_queue_t) queue complentBlock:(void(^)(void)) block;
//指定队列下 Barrier 运行
+ (void)runBarrierAsync:(dispatch_queue_t) queue complentBlock:(void(^)(void)) block;
//指定队列同步执行
+ (void)runSyncOnQueue:(dispatch_queue_t)queue complentBlock:(void (^)(void))block;
@end
