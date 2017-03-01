//
//  QYScrollView.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/23.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYScrollView.h"

@implementation QYScrollView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.delaysContentTouches = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        self.delaysContentTouches = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.delaysContentTouches = NO;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.delaysContentTouches = NO;
}
- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    return YES;
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    // 返回 YES, 当触摸在子视图上时 ScrollView 可以滚动;
    // NO 当触摸在子视图上时 ScrollView 不可以滚动.
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

