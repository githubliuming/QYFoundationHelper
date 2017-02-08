//
//  NSNumber+Common.h
//  Category
//
//  Created by liuming on 16/7/14.
//  Copyright © 2016年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Common)
/**
 *  double类型转成字符串
 *
 *  @return 字符串
 */
- (NSString *)doubleForString;
/**
 *  int类型转成字符串
 *
 *  @return 字符串
 */
- (NSString *)intForString;
/**
 *  long类型转成字符串
 *
 *  @return 字符串
 */
- (NSString *)longForString;
/**
 *  long long 类型转成字符串
 *
 *  @return 字符串
 */
- (NSString *)llForString;
/**
 *  unsignedLong 类型转成字符串
 *
 */
- (NSString *)ulongForString;
/**
 *  integer类型转成字符串
 *
 */
- (NSString *)integerForString;
/**
 *  double 类型转成字符串
 *
 *  @param format 格式字符串 默认 %f
 *
 */
- (NSString *)doubleToStringWithFormat:(NSString *)format;
/**
 *  int 类型转换成字符串
 *
 *  @param format 格式字符串
 *
 */
- (NSString *)intToStringWithFormat:(NSString *)format;
/**
 *  long 类型转换成字符串
 *
 *  @param format 格式字符串
 *
 */
- (NSString *)longToStringWithFormat:(NSString *)format;
/**
 *  long long类型转换成字符串
 *
 *  @param format 格式字符串
 */
- (NSString *)llToStringWithFormat:(NSString *)format;
/**
 *   unsigned long 类型转换成字符串
 *
 *  @param format 格式字符串
 *
 */
- (NSString *)ulongToStringWithFormat:(NSString *)format;
/**
 *  integer 类型转换成字符串
 *
 *  @param format 格式字符串
 *
 */
- (NSString *)integerToStringWithFormat:(NSString *)format;
@end
