//
//  NSArray+QYBlock.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "NSArray+QYBlock.h"

@implementation NSArray (QYBlock)

- (void)each:(void (^)(id object))block
{
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block
{
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)map:(id (^)(id object))block
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self)
    {
        [array addObject:block(object) ?: [NSNull null]];
    }

    return array;
}

- (NSArray *)filter:(BOOL (^)(id object))block
{
    return [self
        filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return block(evaluatedObject);
        }]];
}

- (NSArray *)reject:(BOOL (^)(id object))block
{
    return [self
        filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return !block(evaluatedObject);
        }]];
}

- (id)detect:(BOOL (^)(id object))block
{
    for (id object in self)
    {
        if (block(object)) return object;
    }
    return nil;
}

- (id)reduce:(id (^)(id accumulator, id object))block { return [self reduce:nil withBlock:block]; }
- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block
{
    id accumulator = initial;

    for (id object in self) accumulator = accumulator ? block(accumulator, object) : object;

    return accumulator;
}

@end

