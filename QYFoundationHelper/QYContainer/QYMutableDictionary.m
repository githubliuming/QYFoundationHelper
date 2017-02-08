//
//  QYMutableDictionary.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYMutableDictionary.h"
#import "QYGCDQueueHelper.h"

// 遵守原则 同步读 异步写

@interface QYMutableDictionary ()
{
    CFMutableDictionaryRef _MutableDicRef;
}

@end

@implementation QYMutableDictionary

- (instancetype)init { return [self initWithCapacity:0]; }
- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];

    if (self)
    {
        _MutableDicRef = CFDictionaryCreateMutable(kCFAllocatorDefault, numItems, &kCFTypeDictionaryKeyCallBacks,
                                                   &kCFTypeDictionaryValueCallBacks);
    }
    return self;
}
- (NSUInteger)count
{
    __block NSUInteger count = 0;
    [self runSync:^{
        count = CFDictionaryGetCount(_MutableDicRef);
    }];
    return count;
}

- (id)objectForKey:(id)aKey
{
    __block id obj;
    [self runSync:^{

        obj = CFDictionaryGetValue(_MutableDicRef, (__bridge const void *)(aKey));
    }];
    return obj;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    aKey = [aKey copyWithZone:NULL];
    [self runAsnc:^{

        CFDictionarySetValue(_MutableDicRef, (__bridge const void *)(aKey), (__bridge const void *)(anObject));
    }];
}

- (void)removeObjectForKey:(id)aKey
{
    [self runAsnc:^{

        CFDictionaryRemoveValue(_MutableDicRef, (__bridge const void *)(aKey));
    }];
}

- (void)removeAllObject
{
    [self runAsnc:^{

        CFDictionaryRemoveAllValues(_MutableDicRef);
    }];
}

- (NSEnumerator *)keyEnumerator
{
    __block NSEnumerator *enu;
    [self runAsnc:^{

        enu = [(__bridge id)_MutableDicRef keyEnumerator];
    }];
    return enu;
}

- (void)dealloc
{
    if (_MutableDicRef) CFRelease(_MutableDicRef);
    _MutableDicRef = NULL;
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
        queue = [QYGCDQueueHelper creatGCDQueue:@"com.qy.QYMutableDictionary" style:QYQueueStyleCONCURRENT];
    });

    return queue;
}
- (void)runSync:(void (^)(void))block { [QYGCDQueueHelper runSyncOnQueue:self.syncQueue complentBlock:block]; }
- (void)runAsnc:(void (^)(void))block { [QYGCDQueueHelper runBarrierAsync:self.syncQueue complentBlock:block]; }
@end

