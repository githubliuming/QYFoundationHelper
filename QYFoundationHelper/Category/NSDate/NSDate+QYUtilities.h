//
//  NSDate+Utilities.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
// https://github.com/erica/NSDate-Extensions
#import <Foundation/Foundation.h>
#define D_MINUTE 60
#define D_HOUR 3600
#define D_DAY 86400
#define D_WEEK 604800
#define D_YEAR 31556926
@interface NSDate (QYUtilities)
+ (NSCalendar *)currentCalendar;  // avoid bottlenecks
#pragma mark---- Decomposing dates 分解的日期
@property(readonly) NSInteger nearestHour;
@property(readonly) NSInteger hour;
@property(readonly) NSInteger minute;
@property(readonly) NSInteger seconds;
@property(readonly) NSInteger day;
@property(readonly) NSInteger month;
@property(readonly) NSInteger week;
@property(readonly) NSInteger weekday;
@property(readonly) NSInteger nthWeekday;  // e.g. 2nd Tuesday of the month == 2
@property(readonly) NSInteger year;

#pragma mark----short time 格式化的时间
@property(nonatomic, readonly) NSString *shortString;
@property(nonatomic, readonly) NSString *shortDateString;
@property(nonatomic, readonly) NSString *shortTimeString;
@property(nonatomic, readonly) NSString *mediumString;
@property(nonatomic, readonly) NSString *mediumDateString;
@property(nonatomic, readonly) NSString *mediumTimeString;
@property(nonatomic, readonly) NSString *longString;
@property(nonatomic, readonly) NSString *longDateString;
@property(nonatomic, readonly) NSString *longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)stringWithFormat:(NSString *)format;

#pragma mark---- 从当前日期相对日期时间
///明天
+ (NSDate *)dateTomorrow;
///昨天
+ (NSDate *)dateYesterday;
///今天后几天
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes;

#pragma mark---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)isToday;
///是否是明天
- (BOOL)isTomorrow;
///是否是昨天
- (BOOL)isYesterday;

///是否是同一周
- (BOOL)isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)isThisWeek;
///是否是本周的下周
- (BOOL)isNextWeek;
///是否是本周的上周
- (BOOL)isLastWeek;

///是否是同一月
- (BOOL)isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)isThisMonth;
///是否是本月的下月
- (BOOL)isNextMonth;
///是否是本月的上月
- (BOOL)isLastMonth;

///是否是同一年
- (BOOL)isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)isThisYear;
///是否是今年的下一年
- (BOOL)isNextYear;
///是否是今年的上一年
- (BOOL)isLastYear;

///是否提前aDate
- (BOOL)isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)isInFuture;
///是否晚是过去
- (BOOL)isInPast;

///是否是工作日
- (BOOL)isTypicallyWorkday;
///是否是周末
- (BOOL)isTypicallyWeekend;

#pragma mark---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes;

#pragma mark---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)distanceYearsToDate:(NSDate *)anotherDate;
@end

