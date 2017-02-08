
//
//  QYUinityDefinition.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#ifndef QYUinityDefinition_h
#define QYUinityDefinition_h


//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#pragma mark - common functions
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

//释放一个对象
#define SAFE_DELETE(P) if(P) {  [P release], P = nil; }

#define SAFE_RELEASE(x) [x release];x=nil

//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

//设置View的tag属性
#define VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]
//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

/**
 *  设置选项宏定义
 */
#define defaults [NSUserDefaults standardUserDefaults]

#define defaultSave(key, value)            \
[defaults setObject:value forKey:key]; \
[defaults synchronize]

#define defaultDel(key)                \
[defaults removeObjectForKey:key]; \
[defaults synchronize]

#define defaultGet(key) [defaults objectForKey:key]


//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

//声明一个单例方法
#define SYNTHESIZE_METHOD_FOR_CLASS(classname)                  \
   +(classname *)sharedInstancetype;

//单例化一个类
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname)               \
                                                                \
    static classname *shared##classname = nil;                  \
                                                                \
    +(classname *)sharedInstancetype                             \
    {                                                           \
        @synchronized(self)                                     \
        {                                                       \
            if (shared##classname == nil)                       \
            {                                                   \
                shared##classname = [[self alloc] init];        \
            }                                                   \
        }                                                       \
                                                                \
        return shared##classname;                               \
    }                                                           \
                                                                \
    +(id)allocWithZone : (NSZone *)zone                         \
    {                                                           \
        @synchronized(self)                                     \
        {                                                       \
            if (shared##classname == nil)                       \
            {                                                   \
                shared##classname = [super allocWithZone:zone]; \
                return shared##classname;                       \
            }                                                   \
        }                                                       \
                                                                \
        return nil;                                             \
    }                                                           \
                                                                \
    -(id)copyWithZone : (NSZone *)zone { return self; }
#endif /* QYUinityDefinition_h */

