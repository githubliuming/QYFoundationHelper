//
//  UITextView+QYAutolayoutFont.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/1.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (QYAutolayoutFont)
@property(nonatomic, strong) UIFont *curFont;

/// 改变textView大小时根据当前textView的大小
/// 计算出能够刚好显示完的最大字号
- (void)autoLayoutFont;

///获取获取每行显示的文本
-(NSArray *)getSeparatedLines;

///获取当前文本的行数
- (NSInteger) getSeparateLineCount;


- (void)setLinePaddingScale:(double)scale;
@end
