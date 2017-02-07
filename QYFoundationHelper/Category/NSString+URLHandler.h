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
 *  @return
 */
- (NSURL *)convertToURL;
/**
 *  讲字符串转成文件地址
 *
 *  @return
 */
- (NSURL *)convertToFileURL;

/**
 *  验证网络地址格式
 */
- (BOOL)isValidUrl;
@end
