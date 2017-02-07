//
//  UIView+Expand.h
//  Category
//
//  Created by liuming on 16/8/3.
//  Copyright © 2016年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Expand)

- (CGFloat)left;
- (void)setLeft:(CGFloat)left;

- (void)setRight:(CGFloat)right;
- (CGFloat)right;

- (void)setTop:(CGFloat)top;
- (CGFloat)top;

- (void)setBottom:(CGFloat)bottom;
- (CGFloat)bottom;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setHeight:(CGFloat)height;
- (CGFloat)height;
@end
