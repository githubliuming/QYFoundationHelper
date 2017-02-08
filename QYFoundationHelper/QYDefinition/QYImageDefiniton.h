//
//  QYImageDefiniton.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#ifndef QYImageDefiniton_h
#define QYImageDefiniton_h

//----------------------图片----------------------------

//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//建议使用前两种宏定义,性能高于后者

#endif /* QYImageDefiniton_h */
