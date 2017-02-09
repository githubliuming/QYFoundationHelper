//
//  NSString+URLHandler.m
//  Category
//
//  Created by liuming on 16/8/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "NSString+URLHandler.h"
#import <UIKit/UIKit.h>
@implementation NSString (URLHandler)

- (NSURL *)convertToURL
{
    if ([self isValidUrl])
    {
        NSURL *url = [NSURL URLWithString:self];
        return url;
    }
    else
    {
        return nil;
    }
}
- (NSURL *)convertToFileURL
{
    NSURL *url = [NSURL fileURLWithPath:self];
    return url;
}

- (BOOL)isValidUrl
{
    NSString *regex = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [urlTest evaluateWithObject:self];
}

- (NSString *)urlEncode { return [self urlEncodeUsingEncoding:NSUTF8StringEncoding]; }
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding
{
    if (IOS_SYSTEM_VERSION >= 9.0)
    {
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@&=+$,/?%#[]% "];
        return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
            NULL, (__bridge CFStringRef)self, NULL, (CFStringRef) @"!*'\"();:@&=+$,/?%#[]% ",
            CFStringConvertNSStringEncodingToEncoding(encoding));
#pragma clang diagnostic pop
    }
}

/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)urlDecode {
    return [self urlDecodeUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding
{
    if (IOS_SYSTEM_VERSION >= 9.0)
    {
        return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapes(
            NULL, (__bridge CFStringRef)self, CFSTR(""));
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
            NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(encoding));
#pragma clang diagnostic pop
    }
}

/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)dictionaryFromURLParameters
{
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs)
    {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = @"";
        if (IOS_SYSTEM_VERSION >= 9.0)
        {
            val = [[kv objectAtIndex:1] stringByRemovingPercentEncoding];
        }
        else
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
        }
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    return params;
}

@end

