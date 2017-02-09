//
//  UIImage+QYFXImage.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//
//收录自  https://github.com/nicklockwood/FXImageView
#import <UIKit/UIKit.h>

@interface UIImage (QYFXImage)

//返回裁剪到指定矩形（图像坐标）的图像的副本。
- (UIImage *)imageCroppedToRect:(CGRect)rect;

//返回缩放到指定大小的图像的副本。此方法可能会更改图像的宽高比。
- (UIImage *)imageScaledToSize:(CGSize)size;

//返回缩放以适合指定大小而不更改其长宽比的图像副本。如果宽高比不匹配，则所得到的图像可以小于在一个维度中指定的尺寸。不会添加填充。
- (UIImage *)imageScaledToFitSize:(CGSize)size;

//返回缩放以适合指定大小而不更改其长宽比的图像副本。如果图像宽高比与指定尺寸的宽高比不匹配，则图像将被裁剪以适合。
- (UIImage *)imageScaledToFillSize:(CGSize)size;

//返回使用指定的UIViewContentMode缩放和/或裁剪为指定大小的图像的副本。此方法可用于在UIImageView中显示时匹配UIViewContentMode对图像的效果。如果padToFit参数为NO，则生成的图像可能小于指定的长宽比不匹配的大小。如果padToFit为YES，将在图像周围添加额外的透明像素，以将其填充到指定的大小。
- (UIImage *)imageCroppedAndScaledToSize:(CGSize)size
                             contentMode:(UIViewContentMode)contentMode
                                padToFit:(BOOL)padToFit;

//返回使用渐变渐变为透明的图像的垂直反射副本。缩放参数确定图像逐渐变细的点，其值应介于0.0和1.0之间。
- (UIImage *)reflectedImageWithScale:(CGFloat)scale;

//返回包含具有指定比例，分隔间隙和alpha（不透明度）的反射的图像副本。原始图像将在新图像内垂直居中，图像上方的空间用与下面反射高度匹配的透明像素填充。这使得更容易在UIImageView中定位图像。
- (UIImage *)imageWithReflectionWithScale:(CGFloat)scale gap:(CGFloat)gap alpha:(CGFloat)alpha;

//返回具有使用指定颜色，偏移和模糊呈现的阴影的图像副本。无论偏移值如何，原始图像将在新图像中垂直居中，以便更轻松地将图像放置在UIImageView中。
- (UIImage *)imageWithShadowColor:(UIColor *)color offset:(CGSize)offset blur:(CGFloat)blur;

//返回具有指定曲率半径的图像的副本。
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;

//返回具有指定alpha（不透明度）的图像的副本。alpha乘以图像的原始alpha通道，因此此方法只能用于使图像更透明，而不是更不透明。
- (UIImage *)imageWithAlpha:(CGFloat)alpha;

//使用指定的蒙版图像剪切图像。掩模图像应该是不透明的灰度alpha掩模。如果您希望使用透明蒙版图像，请使用该maskImageFromImageAlpha方法将其转换为正确的格式。
- (UIImage *)imageWithMask:(UIImage *)maskImage;

//此方法从具有嵌入的alpha蒙版的图像中提取alpha通道，并将其作为适合与该imageWithMask:方法一起使用的独立灰度蒙版图像返回。
- (UIImage *)maskImageFromImageAlpha;
@end

