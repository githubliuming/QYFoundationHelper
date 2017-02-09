//
//  NSString+QYSize.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "NSString+QYSize.h"

@implementation NSString (QYSize)
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];

    CGSize textSize;

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
        textSize =
            [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                               options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine)
                            attributes:attributes
                               context:nil]
                .size;
    }
    else
    {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
    textSize =
        [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                           options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine)
                        attributes:attributes
                           context:nil]
            .size;
#endif

    return textSize;
}
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];

    CGSize textSize;

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
    {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
        textSize =
            [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                               options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine)
                            attributes:attributes
                               context:nil]
                .size;
    }
    else
    {
        textSize = [self sizeWithFont:textFont
                    constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)
                        lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName : textFont, NSParagraphStyleAttributeName : paragraph};
    textSize =
        [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height)
                           options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine)
                        attributes:attributes
                           context:nil]
            .size;
#endif

    return textSize;
}
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    return ceilf([self sizeWithFont:font constrainedToWidth:width].height);
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    return ceilf([self sizeWithFont:font constrainedToHeight:height].width);
}
@end

