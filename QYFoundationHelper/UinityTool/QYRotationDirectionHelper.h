//
//  QYRotationDirectionHelper.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/22.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, QYRotationStyle) {
    QYRotationStyleUp,
    QYRotationStyleLeft,
    QYRotationStyleDown,
    QYRotationStyleRight,
    QYRotationStyleNotFound = NSIntegerMax,
};

@interface QYRotationDirectionHelper : NSObject

/**
 根据transform 计算出旋转的方向

 @param transform 目标transform
 @return 旋转方向
 */
+ (QYRotationStyle)roationDirectonWithTransform:(CGAffineTransform)transform;

/**
 根据transform 计算出旋转的角度

 @param tranform 目标transform
 @return 选择的角度
 */
+ (CGFloat)getRadiansWithTransform:(CGAffineTransform)tranform;
@end

