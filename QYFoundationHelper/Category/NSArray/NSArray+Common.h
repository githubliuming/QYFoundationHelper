//
//  NSArray+Common.h
//  Category
//
//  Created by liuming on 16/7/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Common)

/**
 *  返回满组谓词条件所有的对象
 *
 *  @param predicateStr 谓词条件字符串
 *
 *  @return 满足条件的所有对象
 */
- (NSArray *)findAll:(NSString *)predicateStr;
/**
 *  查找满足条件的第一个元素
 *
 *  @param predicateStr 谓词条件字符串
 *
 *  @return 满足条件的第一个对象
 */
- (NSObject *)find:(NSString *)predicateStr;
/**
 *  返回满足条件的最后一个元素
 *
 *  @param predicateStr 谓词查找条件
 *
 *  @return 满足条件的对象
 */
- (NSObject *)findLast:(NSString *)predicateStr;
/**
 *  添加一个元素到数组中
 *
 *  @param obj 添加的元素
 *
 *  @return 新的数组
 */
- (NSArray *)add:(NSObject *)obj;
/**
 *  向数组中插入一个元素
 *
 *  @param obj   插入的元素
 *  @param index 插入索引
 *
 *  @return 新的数组
 */
- (NSArray *)insertObj:(NSObject *)obj atIndex:(NSUInteger)index;
/**
 *  翻转数组
 *
 *  @return 新数组
 */
- (NSArray *)reverse;
/**
 *  翻转数组中的部分元素
 *
 *  @param star 起始位置
 *  @param end  终点位置
 *
 *  @return 新数组
 */
- (NSArray *)reverse:(NSUInteger)star end:(NSUInteger)end;
/**
 *  删除满足谓词条件的元素
 *
 *  @param predicateStr 谓词条件
 *
 *  @return 新数组
 */
- (NSArray *)remove:(NSString *)predicateStr;
/**
 *  删除指定索引的元素
 *
 *  @param index 元素索引
 *
 *  @return 新数组
 */
- (NSArray *)removeAtIndex:(NSUInteger)index;
/**
 *  删除数组中某个区段的元素
 *
 *  @param start 起始
 *  @param end   结束
 *
 *  @return 新数组
 */
- (NSArray *)removeWithStart:(NSUInteger)start end:(NSUInteger)end;
@end
