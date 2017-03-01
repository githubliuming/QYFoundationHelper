//
//  UITextView+QYAutolayoutFont.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/1.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "UITextView+QYAutolayoutFont.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>

#define MAX_FONT_SIZE 500
static const void *externCurFontKey = &externCurFontKey;
@implementation UITextView (QYAutolayoutFont)

- (UIFont *)curFont { return objc_getAssociatedObject(self, externCurFontKey); }
- (void)setCurFont:(UIFont *)curFont
{
    objc_setAssociatedObject(self, externCurFontKey, curFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isIOS7OrLater { return ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0f); }
- (BOOL)isBeyondSize:(CGSize)size
{
    if ([self isIOS7OrLater])
    {
        CGFloat ost = self.textContainerInset.top + self.textContainerInset.bottom;
        CGFloat ost_x =self.textContainerInset.left + self.textContainerInset.right;
        return (size.height + ost > self.frame.size.height) || (size.width + ost_x > self.frame.size.width);
    }
    else
    {
        return self.contentSize.height > self.frame.size.height;
    }
}

- (void)centerTextVertically
{
    if ([self isIOS7OrLater])
    {
        CGSize tH = [self textSizeWithFont:self.font.pointSize text:nil];
        
        CGFloat offset = (self.frame.size.height - tH.height) / 2.f;
        CGFloat offset_x = (self.frame.size.width - tH.width)/2.0f;
        NSLog(@"offset_y = %f offset_x = %f",offset,offset_x);
        self.textContainerInset = UIEdgeInsetsMake(offset, -offset_x, offset,- offset_x);
    }
    else
    {
        CGFloat fH = self.frame.size.height;
        CGFloat cH = self.contentSize.height;
        [self setContentOffset:CGPointMake(0, (cH - fH) / 2.f)];
    }
}

- (CGSize)textSizeWithFont:(CGFloat)font text:(NSString *)string
{
    NSString *text = string ? string : self.text;
    
    CGFloat pO = self.textContainer.lineFragmentPadding * 2;
    CGFloat cW = self.frame.size.width - pO;
    
    CGSize tH = CGSizeZero;
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attribute = @{NSFontAttributeName : [self.curFont fontWithSize:font], NSParagraphStyleAttributeName : paragraphStyle};
    tH = [text boundingRectWithSize:CGSizeMake(cW, MAXFLOAT)
                            options:NSStringDrawingTruncatesLastVisibleLine |
          NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                         attributes:attribute
                            context:nil]
    .size;
    
    return tH;
}
- (void)autoLayoutFont
{
    if ([self.text length])
    {
        CGFloat cFont = self.font.pointSize;
        CGSize tSize = [self isIOS7OrLater] ? [self textSizeWithFont:cFont text:nil] : CGSizeZero;
        //判断当前字体是否超出了范围，
        BOOL isBeyond  = [self isBeyondSize:tSize];
        if (!isBeyond)
        {
            //放大
            do
            {
                if ([self isIOS7OrLater])
                {
                    tSize = [self textSizeWithFont:++cFont text:nil];
                }
                else
                {
                    [self setFont:[self.curFont fontWithSize:++cFont]];
                }
                
            } while (![self isBeyondSize:tSize] && cFont < MAX_FONT_SIZE);
            
            cFont = (cFont < MAX_FONT_SIZE) ? cFont : MAX_FONT_SIZE;
            [self setFont:[self.curFont fontWithSize:--cFont]];
            
        }
        else
        {
            //缩小
            while ([self isBeyondSize:tSize] && cFont > 0)
            {
                if ([self isIOS7OrLater])
                {
                    tSize = [self textSizeWithFont:--cFont text:nil];
                }
                else
                {
                    [self setFont:[self.curFont fontWithSize:--cFont]];
                }
            }
            
            [self setFont:[self.curFont fontWithSize:cFont]];
            
        }
    }
    [self centerTextVertically];
}

- (NSArray *)getSeparatedLines
{
    NSString *text = [self text];
    UIFont *font = [self font];
    CGRect rect = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height) ;
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName
                   value:(__bridge id)myFont
                   range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef)line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;
}

///获取当前的文本行数
- (NSInteger)getSeparateLineCount { return [[self getSeparatedLines] count]; }
- (void)setLinePaddingScale:(double)scale
{
    if(scale == 0)
    {
        return;
    }
    self.textContainer.lineFragmentPadding *= scale;
    UIEdgeInsets textInset = self.textContainerInset;
    textInset.top *= scale;
    textInset.bottom *=scale;
    textInset.left *= scale;
    textInset.right *= scale;
    self.textContainerInset = textInset;
}
@end
