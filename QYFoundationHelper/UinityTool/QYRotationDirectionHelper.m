//
//  QYRotationDirectionHelper.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/22.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "QYRotationDirectionHelper.h"

@implementation QYRotationDirectionHelper

+ (QYRotationStyle)roationDirectonWithTransform:(CGAffineTransform)transform
{
    CGFloat videoAngleInDegree = [self radiansToDegrees:atan2(transform.b, transform.a)];

    QYRotationStyle style = QYRotationStyleNotFound;
    switch ((int)videoAngleInDegree)
    {
        case 0:
            style = QYRotationStyleRight;
            break;
        case 90:
            style = QYRotationStyleUp;
            break;
        case 180:
            style = QYRotationStyleLeft;
            break;
        case -90:
            style = QYRotationStyleDown;
            break;
        default:
            style = QYRotationStyleNotFound;
            break;
    }

    return style;
}

+ (CGFloat)getRadiansWithTransform:(CGAffineTransform)tranform
{
    return [self radiansToDegrees:atan2(tranform.b, tranform.a)];
}
+ (CGFloat)radiansToDegrees:(CGFloat)radians { return radians * 180 / M_PI; }
@end

