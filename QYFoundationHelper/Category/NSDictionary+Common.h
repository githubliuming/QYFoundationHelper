//
//  NSDictionary+Common.h
//  Category
//
//  Created by liuming on 16/7/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSDictionary (Common)

/** 判断字典中是否存在key
 *
 *
 *  @param key 字典key
 *
 *  @return 返回结果 存在YES 不存在NO
 */
- (BOOL)containsKey:(id)key;
/**
 *  判断字典中是否存在value
 *
 *  @param value 字典value
 *
 *  @return 返回结果 存在YES 不存在NO
 */
- (BOOL)containsValue:(id)value;
/**
 *  向字典中添加一个对象
 *
 *  @param anObject value
 *  @param key      key
 *
 *  @return 新字典
 */
- (NSDictionary *)addObject:(id)anObject forKey:(id<NSCopying>)key;
/**
 *  删除字典中一个value
 *
 *  @param key key
 *
 *  @return 新字典
 */
- (NSDictionary *)removeForKey:(NSObject<NSCopying> *)key;
/**
 *  移除字典中所有的key value
 *
 *  @return 新字典
 */
- (NSDictionary *)removeAll;
/**
 *  合并两个字典
 *
 *  @param dict1  字典一
 *  @param dict2 字典二
 *
 *  @return 合并之后的字典
 */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
/**
 *  合并两个字典
 *
 *  @param dict 待合并字典
 *
 *  @return 合并之后的字典
 */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;
//字典转换成json字符串
- (NSString *)toJsonString;

#pragma mark 装箱
- (NSDictionary *)addInt:(int)i forKey:(id<NSCopying>)key;
- (NSDictionary *)addDouble:(double)d forKey:(id<NSCopying>)key;
- (NSDictionary *)addfloat:(float)f forKey:(id<NSCopying>)key;
- (NSDictionary *)addLong:(long)l forKey:(id<NSCopying>)key;
- (NSDictionary *)addLLong:(long long)ll forKey:(id<NSCopying>)key;
- (NSDictionary *)addUlong:(unsigned long)ul forKey:(id<NSCopying>)key;
- (NSDictionary *)addRect:(CGRect)rect forKey:(id<NSCopying>)key;
- (NSDictionary *)addPoint:(CGPoint)point forKey:(id<NSCopying>)key;
- (NSDictionary *)addRange:(NSRange)range forKey:(id<NSCopying>)key;
- (NSDictionary *)addSize:(CGSize)size forKey:(id<NSCopying>)key;
#pragma mark 出箱
- (int)intForKey:(id<NSCopying>)key;
- (double)doubleForKey:(id<NSCopying>)key;
- (float)floatForKey:(id<NSCopying>)key;
- (long)longForKyey:(id<NSCopying>)key;
- (long long)longlongForKey:(id<NSCopying>)key;
- (unsigned long)ulongForKey:(id<NSCopying>)key;
- (CGRect)rectForKey:(id<NSCopying>)key;
- (CGPoint)pointForKey:(id<NSCopying>)key;
- (NSRange)rangeForKey:(id<NSCopying>)key;
- (CGSize)sizeForKey:(id<NSCopying>)key;
- (NSString *)stringForKey:(id<NSCopying>)key;
@end
