//
//  NSScanner+QYPinyin.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QYPinyin)

//带有声调的拼音
- (NSString *)loadIPhonePinyinSymbol;
//去掉声调的拼音
- (NSString *)pinyin;
//字符串完整的拼音数组
- (NSArray *)pinyinArray;
//字符串完整的首字母数组
- (NSArray *)InitialismArray;
//首字母字符串
- (NSString *)InitialismOfPinyin;
//大写的首字母字符串
- (NSString *)InitialismAndUppercaseString;
//带有指定连接符号的首字母字符串
- (NSString *)InitialismWithJoinedString:(NSString *)s;
@end

