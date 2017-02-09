//
//  NSScanner+QYPinyin.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "NSScanner+QYPinyin.h"

@implementation NSString (QYPinyin)

- (NSString *)loadIPhonePinyinSymbol
{
    // kCFStringTransformMandarinLatin 带有声调的汉语拼音  liú míng
    NSMutableString *p = [NSMutableString stringWithString:self];
    CFStringTransform(((__bridge CFMutableStringRef)p), NULL, kCFStringTransformMandarinLatin, NO);
    return p;
}

- (NSString *)pinyin
{
    // kCFStringTransformStripCombiningMarks 去掉声调的汉语拼音 liu ming
    NSMutableString *p = [NSMutableString stringWithString:[self loadIPhonePinyinSymbol]];
    CFStringTransform(((__bridge CFMutableStringRef)p), NULL, kCFStringTransformStripCombiningMarks, NO);
    return p;
}
- (NSArray *)pinyinArray
{
    //将拼音字符串分割成数组
    NSString *py = [self pinyin];
    return [py componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
- (NSArray *)InitialismArray
{
    NSMutableArray *initialismArray = [[NSMutableArray alloc] init];
    NSArray *pinyinArray = [self pinyinArray];
    for (NSString *p in pinyinArray)
    {
        if (p.length > 0)
        {
            [initialismArray addObject:[p substringToIndex:1]];
        }
    }
    return initialismArray;
}

- (NSString *)InitialismOfPinyin { return [[self InitialismArray] componentsJoinedByString:@""]; }
- (NSString *)InitialismAndUppercaseString { return [[self InitialismOfPinyin] uppercaseString]; }
- (NSString *)InitialismWithJoinedString:(NSString *)s { return [[self InitialismArray] componentsJoinedByString:s]; }
@end

