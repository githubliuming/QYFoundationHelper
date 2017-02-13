//
//  UIControl+QYThrottle.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/10.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (QYThrottle)

- (void)addTarget:(id)target
              action:(SEL)action
    forControlEvents:(UIControlEvents)controlEvents
        withThrottle:(double)throttle;
@end

