//
//  UIBarButtonItem+QYBarButtonItem.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (QYBarButtonItem)


/**
 *  创建UIBarButtonItem,高亮
 *
 *  @param image     图片
 *  @param highImage 高亮图片
 *  @param target    监听者
 *  @param action    监听者调用的方法
 *
 *  @return UIBarButtonItem对象
 */
+(instancetype)barButtonItemWithImage:(UIImage*)image highImage:(UIImage*)highImage addTarget:(id)target action:(SEL)action;
/**
 *  创建UIBarButtonItem,选中
 *
 *  @param image     图片
 *  @param selImage 高亮图片
 *  @param target    监听者
 *  @param action    监听者调用的方法
 *
 *  @return UIBarButtonItem对象
 */
+(instancetype)barButtonItemWithImage:(UIImage*)image selImage:(UIImage*)selImage addTarget:(id)target action:(SEL)action;

@end
