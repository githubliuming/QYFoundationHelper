//
//  UIImage+QYBetterFace.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//
// https://github.com/croath/UIImageView-BetterFace
//  a UIImageView category to let the picture-cutting with faces showing better

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, QYAccuracy) {
    QYAccuracyLow = 0,
    QYAccuracyHigh,
};

@interface UIImage (QYBetterFace)

- (UIImage *)betterFaceImageForSize:(CGSize)size accuracy:(QYAccuracy)accurary;

@end

