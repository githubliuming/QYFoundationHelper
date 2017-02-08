//
//  QYMutableArray.m
//  QYViewThreadMonitor
//
//  Created by liuming on 2017/1/11.
//  Copyright © 2017年 burning. All rights reserved.
//

// 遵守原则 同步读 异步写
#import "QYMutableArray.h"
#import "QYGCDQueueHelper.h"
@interface QYMutableArray ()
{
    CFMutableArrayRef _mutableArray;
}
@end
@implementation QYMutableArray
- (id)init { return [self initWithCapacity:0]; }
- (id)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self)
    {
        _mutableArray = CFArrayCreateMutable(kCFAllocatorDefault, numItems, &kCFTypeArrayCallBacks);
    }
    return self;
}
- (NSUInteger)count
{
    __block NSUInteger count = 0;
    [self runSync:^{

        count = CFArrayGetCount(_mutableArray);
    }];
    return count;
}
- (id)objectAtIndex:(NSUInteger)index
{
    NSUInteger count = [self count];
    NSAssert(index >= 0 && index < count, @"error 数组越界");
    __block id obj = nil;
    [self runSync:^{
        obj = CFArrayGetValueAtIndex(_mutableArray, index);
    }];
    return obj;
}

- (void)addObject:(id)anObject
{
    if (anObject)
    {
        [self runAsnc:^{
            CFArrayAppendValue(_mutableArray, &anObject);
        }];
    }
    else
    {
        NSLog(@"error !!! nil insert to array");
    }
}
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    NSUInteger count = CFArrayGetCount(_mutableArray);
    NSAssert(index >= 0 && index < count, @"index 超出数组索引");
    [self runAsnc:^{

        if (anObject)
        {
            CFArrayInsertValueAtIndex(_mutableArray, index, &anObject);
        }
        else
        {
            NSLog(@"error !!! nil insert to array");
        }
    }];
}
- (void)removeLastObject
{
    [self runSync:^{

        NSUInteger count = CFArrayGetCount(_mutableArray);
        CFArrayRemoveValueAtIndex(_mutableArray, count - 1);
    }];
}
- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self runSync:^{
        NSUInteger count = CFArrayGetCount(_mutableArray);
        NSAssert(index >= 0 && index < count, @"error 数组越界");
        CFArrayRemoveValueAtIndex(_mutableArray, index);
    }];
}
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    NSUInteger count = CFArrayGetCount(_mutableArray);
    NSAssert(index >= 0 && index < count, @"error 数组越界");
    [self runSync:^{
        if (anObject)
        {
            CFArrayRemoveValueAtIndex(_mutableArray, index);
        }
        else
        {
            NSLog(@"error !!! can not use nil replace a object");
        }
    }];
}

- (void)dealloc
{
    if (_mutableArray) CFRelease(_mutableArray);
    _mutableArray = NULL;
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

#pragma mark - Private
- (dispatch_queue_t)syncQueue
{
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [QYGCDQueueHelper creatGCDQueue:@"com.qy.ItemBarrierAsyncSetter" style:QYQueueStyleCONCURRENT];
    });

    return queue;
}
- (void)runSync:(void (^)(void))block { [QYGCDQueueHelper runSyncOnQueue:self.syncQueue complentBlock:block]; }
- (void)runAsnc:(void (^)(void))block { [QYGCDQueueHelper runBarrierAsync:self.syncQueue complentBlock:block]; }
@end

