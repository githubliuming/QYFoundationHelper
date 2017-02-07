//
//  NSArray+Common.m
//  Category
//
//  Created by liuming on 16/7/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "NSArray+Common.h"
#import "NSString+Common.h"
@implementation NSArray (Common)
- (NSArray *)findAll:(NSString *)predicateString
{
    if ([predicateString isEmptyOrNil])
    {
        return nil;
    }
    else
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
        return [self filteredArrayUsingPredicate:predicate];
    }
}
- (NSObject *)find:(NSString *)predicateStr
{
    NSArray *result = [self findAll:predicateStr];

    return [result firstObject];
}
- (NSObject *)findLast:(NSString *)predicateStr
{
    NSArray *result = [self findAll:predicateStr];

    return [result lastObject];
}
- (NSArray *)add:(NSObject *)obj
{
    if ([self isKindOfClass:[NSMutableArray class]])
    {
        [((NSMutableArray *)self) addObject:obj];

        return self;
    }
    else
    {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self];
        [temp addObject:obj];
        return [NSArray arrayWithArray:temp];
    }
}
- (NSArray *)insertObj:(NSObject *)obj atIndex:(NSUInteger)index
{
    NSAssert(index >= 0 && index <= self.count - 1, @"出入数据超出数组索引");
    NSAssert(obj != nil, @"插入数据不能为空");

    if ([self isKindOfClass:[NSMutableArray class]])
    {
        [((NSMutableArray *)self) insertObject:obj atIndex:index];

        return self;
    }
    else
    {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self];
        [temp insertObject:obj atIndex:index];
        return [NSArray arrayWithArray:temp];
    }
}
- (NSArray *)reverse
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    NSInteger count = [self count];
    for (NSInteger i = count - 1; i >= 0; i--)
    {
        [temp addObject:[self objectAtIndex:i]];
    }
    return [NSArray arrayWithArray:temp];
}
- (NSArray *)reverse:(NSUInteger)star end:(NSUInteger)end
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:self];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSInteger i = end; i >= star; i--)
    {
        [temp addObject:[self objectAtIndex:i]];
    }
    NSRange rang = NSMakeRange(star, end - star + 1);
    [result replaceObjectsInRange:rang withObjectsFromArray:temp];
    return [NSArray arrayWithArray:result];
}

- (NSArray *)remove:(NSString *)predicateStr
{
    NSArray *result = [self findAll:predicateStr];
    NSMutableArray *temp = [self mutableCopy];
    for (NSObject *obj in result)
    {
        if ([temp containsObject:obj])
        {
            [temp removeObject:obj];
        }
    }

    return [NSArray arrayWithArray:temp];
}
- (NSArray *)removeAtIndex:(NSUInteger)index
{
    NSAssert(index < self.count, @"删除元素的索引越界");
    if ([self isKindOfClass:[NSMutableArray class]])
    {
        [((NSMutableArray *)self) removeObjectAtIndex:index];

        return self;
    }
    else
    {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self];
        [temp removeObjectAtIndex:index];
        return [NSArray arrayWithArray:temp];
    }
}
- (NSArray *)removeWithStart:(NSUInteger)start end:(NSUInteger)end
{
    NSAssert(start < self.count - 1, @"开始索引越界");
    NSAssert(end < self.count - 1, @"结束索引越界");
    NSAssert(start <= end, @"开始索引不能比结束索引的值小");
    NSRange range = NSMakeRange(start, end - start + 1);
    if ([self isKindOfClass:[NSMutableArray class]])
    {
        [((NSMutableArray *)self) removeObjectsInRange:range];

        return self;
    }
    else
    {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self];
        [temp removeObjectsInRange:range];
        return [NSArray arrayWithArray:temp];
    }
}
@end

