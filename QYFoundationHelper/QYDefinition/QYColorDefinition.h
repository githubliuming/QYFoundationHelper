//
//  QYColorDefinition.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#ifndef QYColorDefinition_h
#define QYColorDefinition_h

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)                                         \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
                     blue:((float)(rgbValue & 0xFF)) / 255.0             \
                    alpha:1.0]

#define UIColorFromRGBA(rgbValue, a)                                     \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
                     blue:((float)(rgbValue & 0xFF)) / 255.0             \
                    alpha:a]

// 获取RGB颜色
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

#endif /* QYColorDefinition_h */

