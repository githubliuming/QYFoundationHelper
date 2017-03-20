
//
//  QYDownProgressDelegate.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/20.
//  Copyright © 2017年 burning. All rights reserved.
//

#ifndef QYDownProgressDelegate_h
#define QYDownProgressDelegate_h

@protocol QYProgressViewDelegate <NSObject>

- (double)updateViewWhenProgressChanged:(double)newProgress;

@end

#endif /* QYDownProgressDelegate_h */
