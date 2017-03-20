//
//  QYProgressBaseModel.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/3/20.
//  Copyright © 2017年 burning. All rights reserved.
//

//解决 下载列表中cell 复用引起的 进度条进度不准确的问题
/**
 使用方法 下载数据的model继承该类
 设置model的delegate
 同时 cell 实现 QYProgressViewDelegate 方法。

 在cell的类似refreshUI:方法中添加如下代码
 - (void)refreshUI:(QYProgressBaseModel *)mdoel
 {

    //清空上一个model与改cell的协议关系
    self.model.delegete = nil;

    //以下两行 建立当前model与cell的协议关系
    self.model = model;
    self.model.delegate = self;
    self.progressView.progress = model.progress;
    .....
 }

 以后下载当前model中的文件的进度。只需要将服务器返回的进度写入对应的model中。model会根据协议链 更新屏幕显示的进度条进度
 */
#import <Foundation/Foundation.h>

#import "QYDownProgressDelegate.h"

@interface QYProgressBaseModel : NSObject

@property(nonatomic, assign) id<QYProgressViewDelegate> delegete;

@property(nonatomic, assign) double progress;

@end

