//
//  NSString+QYJSONSerialization.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "NSString+QYJSONSerialization.h"

@implementation NSString (QYJSONSerialization)

- (id)jsonToObject
{
    NSError *error;
    id obj = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                             options:NSJSONReadingMutableContainers
                                               error:&error];
    if (error)
    {
#ifdef DEBUG
        NSLog(@"error ! fail to Serialization a object from a %@ , errorInfo = %@", self, [error userInfo]);
#endif
    }
    return obj;
}

- (NSDictionary *)jsonToDic
{
    id obj = [self jsonToObject];
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return obj;
    }
    return nil;
}
- (NSArray *)jsonToArray
{
    id obj = [self jsonToArray];
    if ([obj isKindOfClass:[NSArray class]])
    {
        return obj;
    }
    return nil;
}
@end

