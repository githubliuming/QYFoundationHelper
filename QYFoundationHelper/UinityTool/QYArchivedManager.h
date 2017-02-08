//
//  QYArchivedManager.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYArchivedManager : NSObject


SYNTHESIZE_METHOD_FOR_CLASS(QYArchivedManager)

/**
 *  序列化一个对象
 *
 *  @param obj 对象 MODEL
 *  @param key 保存的KEY 建议使用类名
 *
 *  @return 序列化结果 成功 返回YES
 */
- (BOOL)archiveWithObj:(NSObject *)obj key:(NSString *)key;

/**
 *  反序列化一个对象
 *
 *  @param key 保存的KEY 建议使用类名
 *
 *  @return 返回 反序列化的OBJ 有可能要返回 nil
 */
- (NSObject *)unArchiveWithKey:(NSString *)key;

/**
 *  删除一个序列化数据
 *
 *  @param key 保存的KEY 建议使用类名
 *
 *  @return 删除结果 YES=删除成功
 */
- (BOOL)deleteArchiveWithKey:(NSString *)key;

@end

#pragma mark - NSKeyedUnarchiver Exceptions
// @see http://lists.apple.com/archives/cocoa-dev/2009/Jul/msg00181.html

/*!
 @brief    Improvements to NSKeyedUnarchiver
 
 @details Method +unarchiveObjectWithData: has been replaced so that
 instead of raising an exception and crashing if given a corrupt archive,
 it just returns nil. Also, another method has been added which
 returns the exception.
 */
@interface NSKeyedUnarchiver (CatchExceptions)

/*!
 @brief    Like unarchiveObjectWithData:, except it returns the
 exception by reference.
 
 @param    exception_p  Pointer which will, upon return, if an
 exception occurred and said pointer is not NULL, point to said
 NSException.
 */
+ (id)unarchiveObjectWithData:(NSData *)data exception_p:(NSException **)exception_p;

@end

