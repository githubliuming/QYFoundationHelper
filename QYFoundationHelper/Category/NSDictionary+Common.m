//
//  NSDictionary+Common.m
//  Category
//
//  Created by liuming on 16/7/13.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "NSDictionary+Common.h"
#import "NSString+Common.h"
@implementation NSDictionary (Common)
- (BOOL)containsKey:(id)key { return [[self allKeys] containsObject:key]; }
- (BOOL)containsValue:(id)value { return [[self allValues] containsObject:value]; }
- (NSDictionary *)addObject:(id)anObject forKey:(id<NSCopying>)key
{
    NSAssert(anObject != nil, @"value不能为空");
    NSAssert(key != nil, @"key 不能为空");
    if ([self isKindOfClass:[NSMutableDictionary class]])
    {
        [((NSMutableDictionary *)self) setObject:anObject forKey:key];

        return self;
    }
    else
    {
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithDictionary:self];
        [temp setObject:anObject forKey:key];

        return [NSDictionary dictionaryWithDictionary:temp];
    }
}
- (NSDictionary *)removeForKey:(NSObject<NSCopying> *)key
{
    NSAssert(key != nil, @"key不能为空");
    if ([self isKindOfClass:[NSMutableDictionary class]])
    {
        [((NSMutableDictionary *)self) removeObjectForKey:key];

        return self;
    }
    else
    {
        NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:self];
        [temp removeObjectForKey:key];
        return [NSDictionary dictionaryWithDictionary:temp];
    }
}

- (NSDictionary *)removeAll
{
    if ([self isKindOfClass:[NSMutableDictionary class]])
    {
        [((NSMutableDictionary *)self)removeAllObjects];
        return self;
    }
    else
    {
        NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:self];
        [temp removeAllObjects];

        return [NSDictionary dictionaryWithDictionary:temp];
    }
}
- (NSString *)toJsonString
{
    if (self == nil)
    {
        return @"{}";
    }

    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error)
    {
        NSAssert(NO, @"序列化失败,请检查内容");
        return @"{}";
    }
    else
    {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

        return jsonString;
    }
}
#pragma mark - 合并
/**
 *  合并两个字典
 *
 *  @param dict1 第一个字典
 *  @param dict2 第二个字典
 *
 *  @return 合并之后得到的字典
 */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [dict2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![dict1 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *newVal = [[dict1 objectForKey:key] dictionaryByMergingWith:(NSDictionary *)obj];
                [result setObject:newVal forKey:key];
            }
            else
            {
                [result setObject:obj forKey:key];
            }
        }
    }];
    return (NSDictionary *)[result mutableCopy];
}
/**
 *  与另一个字典合并
 *
 *  @param dict 将要合并过来的字典
 *
 *  @return 合并后的字典
 */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict
{
    return [[self class] dictionaryByMerging:self with:dict];
}
- (NSDictionary *)addInt:(int)i forKey:(id<NSCopying>)key { return [self addObject:@(i) forKey:key]; }
- (NSDictionary *)addDouble:(double)d forKey:(id<NSCopying>)key { return [self addObject:@(d) forKey:key]; }
- (NSDictionary *)addfloat:(float)f forKey:(id<NSCopying>)key { return [self addObject:@(f) forKey:key]; }
- (NSDictionary *)addLong:(long)l forKey:(id<NSCopying>)key { return [self addObject:@(l) forKey:key]; }
- (NSDictionary *)addLLong:(long long)ll forKey:(id<NSCopying>)key { return [self addObject:@(ll) forKey:key]; }
- (NSDictionary *)addUlong:(unsigned long)ul forKey:(id<NSCopying>)key { return [self addObject:@(ul) forKey:key]; }
- (NSDictionary *)addRect:(CGRect)rect forKey:(id<NSCopying>)key
{
    NSValue *value = [NSValue valueWithCGRect:rect];
    return [self addObject:value forKey:key];
}
- (NSDictionary *)addRange:(NSRange)range forKey:(id<NSCopying>)key
{
    NSValue *value = [NSValue valueWithRange:range];
    return [self addObject:value forKey:key];
}
- (NSDictionary *)addPoint:(CGPoint)point forKey:(id<NSCopying>)key
{
    NSValue *value = [NSValue valueWithCGPoint:point];

    return [self addObject:value forKey:key];
}

- (NSDictionary *)addSize:(CGSize)size forKey:(id<NSCopying>)key
{
    NSValue *value = [NSValue valueWithCGSize:size];
    return [self addObject:value forKey:key];
}
- (int)intForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil || [value respondsToSelector:@selector(intValue)])
    {
        return [value intValue];
    }
    return 0;
}
- (double)doubleForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil || [value respondsToSelector:@selector(doubleValue)])
    {
        return [value doubleValue];
    }

    return 0.0f;
}
- (float)floatForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil && [value respondsToSelector:@selector(floatValue)])
    {
        return [value floatValue];
    }

    return 0.0f;
}
- (long)longForKyey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil && [value respondsToSelector:@selector(integerValue)])
    {
        return [value integerValue];
    }

    return 0;
}
- (long long)longlongForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil && [value respondsToSelector:@selector(longLongValue)])
    {
        return [value longLongValue];
    }

    return 0;
}
- (unsigned long)ulongForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    if (value != nil && [value respondsToSelector:@selector(unsignedIntegerValue)])
    {
        return [value unsignedLongValue];
    }

    return 0;
}
- (CGRect)rectForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];

    if (value && [value respondsToSelector:@selector(CGRectValue)])
    {
        return [value CGRectValue];
    }

    return CGRectZero;
}
- (CGPoint)pointForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];

    if (value && [value respondsToSelector:@selector(CGPointValue)])
    {
        return [value CGPointValue];
    }

    return CGPointZero;
}
- (NSRange)rangeForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];

    if (value && [value respondsToSelector:@selector(rangeValue)])
    {
        return [value rangeValue];
    }

    return NSMakeRange(NSNotFound, NSNotFound);
}
- (CGSize)sizeForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];

    if (value && [value respondsToSelector:@selector(CGSizeValue)])
    {
        return [value CGSizeValue];
    }

    return CGSizeZero;
}
- (NSString *)stringForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    NSString *result = [NSString emptyString];
    if (value != nil && [value isKindOfClass:[NSString class]])
    {
        result = value;
    }
    else if ([value respondsToSelector:@selector(stringValue)])
    {
        result = [value stringValue];
    }

    return result;
}
@end

