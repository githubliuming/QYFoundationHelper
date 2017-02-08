//
//  QYDeviceDefiniton.h
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/8.
//  Copyright © 2017年 burning. All rights reserved.
//

#ifndef QYDeviceDefiniton_h
#define QYDeviceDefiniton_h

//-------------------获取设备大小-------------------------
// NavBar高度
#define NavigationBar_HEIGHT 44

//需要横屏或者竖屏，获取屏幕宽度与高度
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000  // 当前Xcode支持iOS8及以上

#define SCREEN_WIDTH                                                                         \
    ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]                      \
         ? [UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale \
         : [UIScreen mainScreen].bounds.size.width)
#define SCREENH_HEIGHT                                                                        \
    ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]                       \
         ? [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale \
         : [UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE                                                                                       \
    ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]                                   \
         ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width / [UIScreen mainScreen].nativeScale,  \
                      [UIScreen mainScreen].nativeBounds.size.height / [UIScreen mainScreen].nativeScale) \
         : [UIScreen mainScreen].bounds.size)
#else
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

//----------------------系统----------------------------

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define isRetina                                                                             \
    ([UIScreen instancesRespondToSelector:@selector(currentMode)]                            \
         ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) \
         : NO)
#define iPhone5                                                                               \
    ([UIScreen instancesRespondToSelector:@selector(currentMode)]                             \
         ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) \
         : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
// iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
// iPhone Simulator
#endif

//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v) \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))


//----------------------系统----------------------------

#endif /* QYDeviceDefiniton_h */

