//
//  QYMutableDictionary.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYMutableDictionary : NSDictionary


- (instancetype) initWithCapacity:(NSUInteger)numItems;

- (NSUInteger)count;

- (id)objectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)removeObjectForKey:(id)aKey;
- (void)removeAllObject;
- (NSEnumerator *)keyEnumerator;
@end
