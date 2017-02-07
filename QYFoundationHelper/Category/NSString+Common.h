//
//  NSString+Common.h
//  Category
//
//  Created by liuming on 16/7/12.
//  Copyright © 2016年 burning. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface NSString (Common)

/**
 *  初始化一个空白字符串
 */
+ (NSString *)emptyString;
/**
 *  讲数组中的字符串用指定字符串连接起来
 */
+ (NSString *)joinArray:(NSArray<NSString *> *)array withString:(NSString *)astring;
/**
 *  判断是否为空字符串
 */
- (BOOL)isEmptyOrNil;
/**
 *  是否包含指定字符串
 */
- (BOOL)contains:(NSString *)string;
/**
 *  拼接一个字符串
 */
- (NSString *)addNewString:(NSString *)aString;
/**
 *  在指定位置插入字符串
 *
 *  @param string 待插入的字符串
 *  @param index  位置
 *
 *  @return 返回一个新的字符串
 */
- (NSString *)insert:(NSString *)string atIndex:(NSInteger)index;
/**
 *  删除指定字符串
 */
- (NSString *)deleteString:(NSString *)aString;
/**
 *  翻转字符串
 */
- (NSString *)convertString;
/**
 *  查找指定字符串所在的位置
 */
- (NSInteger)indexOfString:(NSString *)astring;
/**
 *  查找字符串在数组中的位置
 */
- (NSInteger)indexOfArray:(NSArray<NSString *> *)array;
/**
 *  忽略大小写查找字符串在数组中的位置
 */
- (NSInteger)indexOfArrayCaseInsensitiveSearch:(NSArray<NSString *> *)array;
/**
 *  查找指定字符串第一次出现的位置
 */
- (NSInteger)firstIndexOf:(NSString *)pattern;
/**
 *  查找指定字符串最后一次出现的位置
 */
- (NSInteger)lastIndexOf:(NSString *)pattern;
/**
 *  截取字符中对应位置的一个字符
 */
- (NSString *)stringAt:(NSInteger)index;
/**
 *  在指定位置截取指定长度的字符串
 */
- (NSString *)stringAt:(NSInteger)index length:(NSInteger)length;
/**
 *  计算uuid
 *
 *  @return uuid字符串
 */
- (NSString *)getUUID;

/**
 *  32位小写加密
 *
 *  @return
 */
- (NSString *)md5String_32;

/**
 *  16位大写加密
 *
 *  @return
 */
- (NSString *)md5String_16;

#pragma mark - 验证格式
/**
 *  验证邮箱格式
 */
- (BOOL)isValidEmail;
/**
 *  验证手机格式
 */
- (BOOL)isPhone;



@end
