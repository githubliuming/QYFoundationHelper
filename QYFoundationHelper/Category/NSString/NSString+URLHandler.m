//
//  NSString+URLHandler.m
//  Category
//
//  Created by liuming on 16/8/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "NSString+URLHandler.h"

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
@end

