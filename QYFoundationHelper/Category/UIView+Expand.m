//
//  UIView+Expand.m
//  Category
//
//  Created by liuming on 16/8/3.
//  Copyright © 2016年 burning. All rights reserved.
//

#import "UIView+Expand.h"

@implementation UIView (Expand)

- (CGFloat)left { return self.frame.origin.x; }
- (void)setLeft:(double)left
{
    CGRect newFrame = CGRectMake(left, self.frame.origin.y, [self width], [self height]);

    self.frame = newFrame;
}
- (void)setRight:(double)right
{
    CGFloat distance = right - self.right;
    self.left = self.left + distance;
}
- (CGFloat)right { return self.left + self.width; }
- (void)setTop:(double)top
{
    CGRect newFrame = CGRectMake(0, top, self.width, self.height);
    self.frame = newFrame;
}
- (CGFloat)top { return self.frame.origin.y; }
- (void)setBottom:(double)bottom
{
    CGFloat distance = bottom - self.bottom;
    self.top = self.top + distance;
}
- (CGFloat)bottom { return self.top + self.height; }
- (void)setWidth:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.left, self.top, width, self.height);
    self.frame = newFrame;
}
- (CGFloat)width { return self.frame.size.width; }
- (void)setHeight:(CGFloat)height
{
    CGRect newFrame = CGRectMake(self.left, self.top, self.width, self.top + self.height);
    self.frame = newFrame;
}
- (CGFloat)height { return self.frame.size.height; }
@end

