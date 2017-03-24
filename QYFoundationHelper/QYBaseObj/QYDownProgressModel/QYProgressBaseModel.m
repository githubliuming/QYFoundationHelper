//
//  QYProgressBaseModel.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/20.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYProgressBaseModel.h"
@implementation QYProgressBaseModel
@synthesize progress = _progress;
- (void)setProgess:(double)progess
{
    progess = progess < 0.0f ? 0.0f : progess;
    progess = progess > 1.f ? 1.0f : progess;
    _progress = progess;

    if (self.delegete && [self.delegete respondsToSelector:@selector(updateViewWhenProgressChanged:)])
    {
        [self.delegete updateViewWhenProgressChanged:_progress];
    }
    
    
    
}
- (double)progess { return _progress; }
@end

