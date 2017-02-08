//
//  QYArchivedManager.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYArchivedManager.h"
#import "NSString+Common.h"
#import "QYSwizzleHelper.h"
#import <objc/runtime.h>

@implementation QYArchivedManager
SYNTHESIZE_SINGLETON_FOR_CLASS(QYArchivedManager)

//方法解码归档数据来初始化对象，在对象解归档时调用
- (id)initWithCoder:(NSCoder *)coder
{
    Class cls = [self class];
    while (cls != [NSObject class])
    {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList =
            bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  //*变量列表，含属性以及私有变量
        //(包括在@interface大括号中声明的变量)
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount); /*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;

        for (int i = 0; i < sharedVarCount; i++)
        {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            id varValue = [coder decodeObjectForKey:key];
            if (varValue)
            {
                [self setValue:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return self;
}

//方法对对象属性进行编码，在对象归档时调用
- (void)encodeWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __func__);
    Class cls = [self class];
    while (cls != [NSObject class])
    {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList =
            bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL; /*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount); /*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;

        for (int i = 0; i < sharedVarCount; i++)
        {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];
            if (varValue)
            {
                [coder encodeObject:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
}

- (id)copyWithZone:(NSZone *)zone
{
    NSLog(@"%s", __func__);
    id copy = [[[self class] allocWithZone:zone] init];
    Class cls = [self class];
    while (cls != [NSObject class])
    {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList =
            bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL; /*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount); /*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;

        for (int i = 0; i < sharedVarCount; i++)
        {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];
            if (varValue)
            {
                [copy setValue:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return copy;
}

- (NSString *)filePathWithKey:(NSString *)key
{
    return [QYDocumentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.zip", key]];
}

- (BOOL)archiveWithObj:(NSObject *)obj key:(NSString *)key
{
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:obj forKey:key];
    [archiver finishEncoding];

    BOOL result = [data writeToFile:[self filePathWithKey:key] atomically:YES];

    NSLog(@"%@", result ? @"归档成功" : @"归档失败");

    return result;
}

- (NSObject *)unArchiveWithKey:(NSString *)key
{
    NSLog(@"unArchive key: %@", key);
    if ([key isEmptyOrNil])
    {
        NSLog(@"key isBlank. key:%@", key);
        return nil;
    }

    NSMutableData *dedata = [NSMutableData dataWithContentsOfFile:[self filePathWithKey:key]];

    if (dedata.length == 0)
    {
        NSLog(@"dedata is error!!!");
        return nil;
    }

    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:dedata];
    NSObject *unObj = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];

    if (!unObj)
    {
        NSLog(@"Unarchiver %@ error !!!", key);
    }

    return unObj;
}

- (BOOL)deleteArchiveWithKey:(NSString *)key
{
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:[self filePathWithKey:key]];
    if (exists)
    {
        NSError *err;
        [[NSFileManager defaultManager] removeItemAtPath:[self filePathWithKey:key] error:&err];
        if (err)
        {
            NSLog(@"delete archive error %@", err);
            return NO;
        }
    }
    return exists;
}
@end

@implementation NSKeyedUnarchiver (CatchExceptions)

+ (id)unarchiveObjectWithData:(NSData *)data exception_p:(NSException **)exception_p
{
    id object = nil;

    @try
    {
        // Note: Since methods were swapped, this is invoking the original method
        object = [NSKeyedUnarchiver replacement_unarchiveObjectWithData:data];
    }
    @catch (NSException *exception)
    {
        NSLog(@"exception %@", exception);
        if (exception_p)
        {
            *exception_p = exception;
        }
    }
    @finally
    {
    }

    return object;
}

+ (void)load
{
    // Swap the implementations of +unarchiveObjectWithData: and
    // +replacement_unarchiveObjectWithData:.
    // When the +unarchiveObjectWithData: message is sent to the NSKeyedUnarchiver
    // class object,
    // +replacement_unarchiveObjectWithData: will be invoked instead. Conversely,
    // +replacement_unarchiveObjectWithData: will invoke
    // +unarchiveObjectWithData:.
    [QYSwizzleHelper swizzleMethods:[self class]
                   originalSelector:@selector(unarchiveObjectWithData:)
                   swizzledSelector:@selector(replacement_unarchiveObjectWithData:)];
}

+ (id)replacement_unarchiveObjectWithData:(NSData *)data
{
    return [self unarchiveObjectWithData:data exception_p:NULL];
}

@end

