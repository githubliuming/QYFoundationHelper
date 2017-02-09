//
//  UILabel+QYSuggestSize.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "UILabel+QYSuggestSize.h"

@implementation UILabel (QYSuggestSize)
- (CGSize)suggestedSizeForWidth:(CGFloat)width
{
    if (self.attributedText) return [self suggestSizeForAttributedString:self.attributedText width:width];

    return [self suggestSizeForString:self.text width:width];
}

- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width
{
    if (!string)
    {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                context:nil]
        .size;
}

- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width
{
    if (!string)
    {
        return CGSizeZero;
    }
    return [self
        suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string
                                                                       attributes:@{NSFontAttributeName : self.font}]
                                 width:width];
}

@end

