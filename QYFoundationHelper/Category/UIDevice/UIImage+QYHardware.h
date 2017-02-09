//
//  UIImage+QYHardware.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/9.
//  Copyright © 2017年 burning. All rights reserved.
//

// https://github.com/fahrulazmi/UIDeviceHardware/blob/master/UIDeviceHardware.m
// https://www.theiphonewiki.com/wiki/Models

#import <UIKit/UIKit.h>

@interface UIImage (QYHardware)

+ (NSString *)platform;
+ (NSString *)platformString;
/// mac 地址
+ (NSString *)macAddress;

// cpu频率
+ (NSUInteger)cpuFrequency;

// BUS频率
+ (NSUInteger)busFrequency;

// 当前设备内存大小
+ (NSUInteger)ramSize;
// the current device CPU number
+ (NSUInteger)cpuNumber;

/// 获取iOS系统的版本号
+ (NSString *)systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)totalDiskSpaceBytes;

@end

