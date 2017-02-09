//
//  NSString+URLHandler.h
//  Category
//
//  Created by liuming on 16/8/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (URLHandler)
/**
 *  讲字符串转成网络地址
 *
 */
- (NSURL *)convertToURL;
/**
 *  讲字符串转成文件地址
 *
 */
- (NSURL *)convertToFileURL;

/**
 *  验证网络地址格式
 */
- (BOOL)isValidUrl;

#pragma mark 网络地址编码
/**
 *  @brief  urlEncode
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)urlEncode;

/**
 *  @brief  urlEncode
 *
 *  @param encoding encoding模式  ios9以后默认 uft-8
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)urlDecode;

/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式 ios9以后默认 uft-8
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;

/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)dictionaryFromURLParameters;
@end

