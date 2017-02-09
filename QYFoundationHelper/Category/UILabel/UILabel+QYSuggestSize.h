//
//  UILabel+QYSuggestSize.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QYSuggestSize)

- (CGSize)suggestedSizeForWidth:(CGFloat)width;
- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end

