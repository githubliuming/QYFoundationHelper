//
//  NSArray+QYBlock.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//
//收录自  (https://github.com/shaojiankui/JKCategories)

#import <Foundation/Foundation.h>

@interface NSArray (QYBlock)
//遍历数组
- (void)each:(void (^)(id object))block;
//遍历数组
- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block;
//用数组中的元素做map映射
- (NSArray *)map:(id (^)(id object))block;
//筛选出符合条件的对象
- (NSArray *)filter:(BOOL (^)(id object))block;
//筛选出不符合条件的对象
- (NSArray *)reject:(BOOL (^)(id object))block;
//查找出符合条件的第一个对象
- (id)detect:(BOOL (^)(id object))block;
//数组类元素计算操作
- (id)reduce:(id (^)(id accumulator, id object))block;
//带有初始值的计算
- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;
@end

