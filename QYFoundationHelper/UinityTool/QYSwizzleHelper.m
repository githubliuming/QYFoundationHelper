//
//  QYSwizzHelper.m
//  QYViewThreadMonitor
//
//  Created by liuming on 2017/1/11.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYSwizzleHelper.h"
#import <objc/runtime.h>
@implementation QYSwizzleHelper

+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel {
    
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, swizMethod);
    }
}
@end
