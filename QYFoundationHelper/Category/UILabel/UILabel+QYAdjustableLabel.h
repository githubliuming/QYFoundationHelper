//
//  UILabel+QYAdjustableLabel.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//
//  This code is provided without any warranties.
//  Hack around and enjoy ;)
//

#import <UIKit/UIKit.h>

@interface UILabel (QYAdjustableLabel)

// General method. If minSize is set to CGSizeZero then
// it is ignored
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize minimumSize:(CGSize)minSize minimumFontSize:(int)minFontSize;

// Adjust label using only the maximum size and the
// font size as constraints
// =====================================================
- (void)adjustLabelToMaximumSize:(CGSize)maxSize minimumFontSize:(int)minFontSize;

// Adjust the size of the label using only the font
// size as a constraint (the maximum size will be
// calculated automatically based on the screen size)
// =====================================================
- (void)adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

// Adjust label without any constraints (the maximum
// size will be calculated automatically based on the
// screen size)
// =====================================================
- (void)adjustLabel;

@end

