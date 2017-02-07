//
//  QYSwizzHelper.h
//  QYViewThreadMonitor
//
//  Created by liuming on 2017/1/11.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYSwizzleHelper : NSObject

+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel;
@end
