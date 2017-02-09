//
//  NSString+QYJSONSerialization.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QYJSONSerialization)

- (NSDictionary *)jsonToDic;
- (NSArray *)jsonToArray;
@end
