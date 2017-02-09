//
//  NSString+Common.m
//  Category
//
//  Created by liuming on 16/7/12.
//  Copyright © 2016年 burning. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Common.h"

@implementation NSString (Common)

+ (NSString *)emptyString { return @""; }
- (BOOL)isEmptyOrNil
{
    if (self.length > 0)
    {
        NSString *temp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (temp.length > 0)
        {
            if ([self isEqualToString:@"nil"] || [self isEqualToString:@"null"] || [self isEqualToString:@"(null)"])
            {
                return YES;
            }
            return NO;
        }
    }
    return YES;
}

+ (NSString *)joinArray:(NSArray<NSString *> *)array withString:(NSString *)astring
{
    NSMutableString *temp = [[NSMutableString alloc] init];
    [array enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {

        if (idx == 0)
        {
            [temp appendString:obj];
        }
        else
        {
            [temp appendFormat:@"%@%@", astring, obj];
        }
    }];

    return temp;
}
- (BOOL)contains:(NSString *)string { return [self rangeOfString:string].location != NSNotFound; }
- (NSString *)addNewString:(NSString *)aString
{
    if ([self isKindOfClass:[NSMutableString class]])
    {
        [(NSMutableString *)self appendString:aString];
        return self;
    }
    else
    {
        NSString *resultStr = [NSString stringWithFormat:@"%@%@", self, aString];

        return resultStr;
    }
}

- (NSString *)insert:(NSString *)string atIndex:(NSInteger)index
{
    index = MAX(index, 0);
    index = MIN(index, self.length);
    NSString *preString = [self substringToIndex:index];
    NSString *lastString = [self substringFromIndex:index + 1];
    return [NSString stringWithFormat:@"%@%@%@", preString, string, lastString];
}

- (NSString *)deleteString:(NSString *)aString
{
    NSString *tempString = [self stringByReplacingOccurrencesOfString:aString withString:@""];
    return tempString;
}
- (NSString *)convertString
{
    NSInteger count = self.length;
    if (count == 1)
    {
        return self;
    }
    else
    {
        NSMutableString *string = [[NSMutableString alloc] init];
        for (NSInteger i = count - 1; i >= 0; i--)
        {
            NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
            [string appendString:s];
        }

        return string;
    }
}
- (NSInteger)indexOfString:(NSString *)astring { return [self rangeOfString:astring].location; }
- (NSInteger)indexOfArray:(NSArray<NSString *> *)array
{
    __block NSInteger index = NSNotFound;
    [array enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {

        if ([obj isEqualToString:self])
        {
            index = idx;
        }
    }];

    return index;
}
- (NSInteger)indexOfArrayCaseInsensitiveSearch:(NSArray<NSString *> *)array
{
    __block NSInteger index = NSNotFound;
    if ([self isEmptyOrNil])
    {
        return index;
    }
    [array enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {

        NSComparisonResult result = [self compare:obj options:NSCaseInsensitiveSearch];
        if (result == NSOrderedSame)
        {
            index = idx;
            *stop = YES;
        }
    }];

    return index;
}
- (NSString *)stringAt:(NSInteger)index
{
    if (index < 0 || index > self.length)
    {
        return [NSString emptyString];
    }

    if ([self isEmptyOrNil])
    {
        return [NSString emptyString];
    }

    return [self substringWithRange:NSMakeRange(index, 1)];
}
- (NSString *)stringAt:(NSInteger)index length:(NSInteger)length
{
    if (index < 0 || index > self.length || self.length < index + length)
    {
        return [NSString emptyString];
    }
    if ([self isEmptyOrNil])
    {
        return [NSString emptyString];
    }
    NSRange range = NSMakeRange(index, length);
    return [self substringWithRange:range];
}

- (NSInteger)firstIndexOf:(NSString *)pattern
{
    NSInteger index = NSNotFound;
    for (int i = 0; i < self.length - pattern.length; i++)
    {
        int j = 0;
        while (j < pattern.length)
        {
            NSString *c = [self stringAt:i + j];
            NSString *s = [pattern stringAt:j];

            if (![c isEqualToString:s])
            {
                break;
            }
            j++;
        }
        if (j == pattern.length)
        {
            return i;
        }
    }
    return index;
}
- (NSInteger)lastIndexOf:(NSString *)pattern
{
    for (NSInteger i = self.length - pattern.length; i >= 0; i--)
    {
        int j = 0;
        while (j < pattern.length)
        {
            NSString *c = [self stringAt:i + j];
            NSString *s = [pattern stringAt:j];

            if (![c isEqualToString:s])
            {
                break;
            }
            j++;
        }

        if (j == pattern.length)
        {
            return i;
        }
    }
    return NSNotFound;
}

- (NSString *)getUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *string = CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return string;
}
- (NSString *)md5String_32
{
    const char *cStr = [self UTF8String];

    unsigned char result[32];

    CC_MD5(cStr, strlen(cStr), result);

    return [NSString stringWithFormat:

                         @"xxxxxxxxxxxxxxxx",

                         result[0], result[1], result[2], result[3],

                         result[4], result[5], result[6], result[7],

                         result[8], result[9], result[10], result[11],

                         result[12], result[13], result[14], result[15],

                         result[16], result[17], result[18], result[19],

                         result[20], result[21], result[22], result[23],

                         result[24], result[25], result[26], result[27],

                         result[28], result[29], result[30], result[31]];
}
- (NSString *)md5String_16
{
    const char *cStr = [self UTF8String];

    unsigned char result[16];

    CC_MD5(cStr, strlen(cStr), result);

    return [NSString stringWithFormat:

                         @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",

                         result[0], result[1], result[2], result[3],

                         result[4], result[5], result[6], result[7],

                         result[8], result[9], result[10], result[11],

                         result[12], result[13], result[14], result[15]

    ];
}
#pragma mark - 验证
#define MaxEmailLength 254
- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL validEmail = [emailTest evaluateWithObject:self];
    if (validEmail && self.length <= MaxEmailLength) return YES;
    return NO;
}

- (BOOL)isPhone
{
    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"self matches %@", phoneRegex];
    BOOL isPhone = [phoneTest evaluateWithObject:self];
    return isPhone;
}

@end

