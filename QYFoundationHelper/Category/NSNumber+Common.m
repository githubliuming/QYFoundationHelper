//
//  NSNumber+Common.m
//  Category
//
//  Created by liuming on 16/7/14.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "NSNumber+Common.h"
#import "NSString+Common.h"
@implementation NSNumber (Common)
- (NSString *)doubleForString { return [self doubleToStringWithFormat:@"%f"]; }
- (NSString *)ulongForString { return [self ulongToStringWithFormat:@"%lu"]; }
- (NSString *)longForString { return [self longToStringWithFormat:@"%ld"]; }
- (NSString *)llForString { return [self llToStringWithFormat:@"%lld"]; }
- (NSString *)intForString { return [self intToStringWithFormat:@"%ld"]; }
- (NSString *)integerForString { return [self integerToStringWithFormat:@"ld"]; }
- (NSString *)doubleToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self doubleForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self doubleValue]];
    }
}
- (NSString *)intToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self integerForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self intValue]];
    }
}
- (NSString *)longToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self longForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self longValue]];
    }
}
- (NSString *)llToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self llForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self longLongValue]];
    }
}
- (NSString *)ulongToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self ulongForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self unsignedLongValue]];
    }
}
- (NSString *)integerToStringWithFormat:(NSString *)format
{
    if ([format isEmptyOrNil])
    {
        return [self integerForString];
    }
    else
    {
        return [NSString stringWithFormat:format, [self integerValue]];
    }
}
@end

