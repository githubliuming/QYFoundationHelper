/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */

/*
 #import <humor.h> : Not planning to implement: dateByAskingBoyOut and dateByGettingBabysitter
 ----
 General Thanks: sstreza, Scott Lawrence, Kevin Ballard, NoOneButMe, Avi`, August Joki. Lily Vulcano, jcromartiej,
 Blagovest Dachev, Matthias Plappert,  Slava Bushtruk, Ali Servet Donmez, Ricardo1980, pip8786, Danny Thuerin, Dennis
 Madsen

 Include GMT and time zone utilities?
 */

#import "NSDate+QYUtilities.h"
#import <UIKit/UIKit.h>
// Thanks, AshFurrow
// static const unsigned   NSDATE_UTILITIES_COMPONENT_FLAGS = (NSYearCalendarUnit| NSMonthCalendarUnit |
// NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit |
// NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define NSDATE_UTILITIES_COMPONENT_FLAGS                                                                             \
    _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")({             \
        unsigned components;                                                                                         \
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)                                               \
        {                                                                                                            \
            components = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |        \
                          NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | \
                          NSWeekdayOrdinalCalendarUnit);                                                             \
        }                                                                                                            \
        else                                                                                                         \
        {                                                                                                            \
            components = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |        \
                          NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | \
                          NSWeekdayOrdinalCalendarUnit);                                                             \
        }                                                                                                            \
        components;                                                                                                  \
    }) _Pragma("clang diagnostic pop")

#else
#define NSDATE_UTILITIES_COMPONENT_FLAGS                                                                              \
    _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")({              \
        unsigned components =                                                                                         \
            (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | \
             NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);     \
        components;                                                                                                   \
    }) _Pragma("clang diagnostic pop")

#endif

@implementation NSDate (QYUtilities)

// Courtesy of Lukasz Margielewski
// Updated via Holger Haenisch
+ (NSCalendar *)currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *)dateWithDaysFromNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *)dateTomorrow { return [NSDate dateWithDaysFromNow:1]; }
+ (NSDate *)dateYesterday { return [NSDate dateWithDaysBeforeNow:1]; }
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *)shortString
{
    return [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)shortTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)shortDateString
{
    return [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)mediumString
{
    return [self stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)mediumTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)mediumDateString
{
    return [self stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)longString
{
    return [self stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)longTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)longDateString
{
    return [self stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 =
        [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 =
        [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    return ((components1.year == components2.year) && (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)isToday { return [self isEqualToDateIgnoringTime:[NSDate date]]; }
- (BOOL)isTomorrow { return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]]; }
- (BOOL)isYesterday { return [self isEqualToDateIgnoringTime:[NSDate dateYesterday]]; }
// This hard codes the assumption that a week is 7 days
- (BOOL)isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 =
        [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 =
        [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];

    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.week != components2.week) return NO;

    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < D_WEEK);
}

- (BOOL)isThisWeek { return [self isSameWeekAsDate:[NSDate date]]; }
- (BOOL)isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self isSameWeekAsDate:newDate];
}

- (BOOL)isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL)isSameMonthAsDate:(NSDate *)aDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 =
        [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 =
        [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif

    return ((components1.month == components2.month) && (components1.year == components2.year));
}

- (BOOL)isThisMonth { return [self isSameMonthAsDate:[NSDate date]]; }
// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL)isLastMonth { return [self isSameMonthAsDate:[[NSDate date] dateBySubtractingMonths:1]]; }
- (BOOL)isNextMonth { return [self isSameMonthAsDate:[[NSDate date] dateByAddingMonths:1]]; }
- (BOOL)isSameYearAsDate:(NSDate *)aDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 =
        [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 =
        [[NSDate currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return (components1.year == components2.year);
}

- (BOOL)isThisYear
{
    // Thanks, baspellis
    return [self isSameYearAsDate:[NSDate date]];
}

- (BOOL)isNextYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif

    return (components1.year == (components2.year + 1));
}

- (BOOL)isLastYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components1 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year - 1));
}

- (BOOL)isEarlierThanDate:(NSDate *)aDate { return ([self compare:aDate] == NSOrderedAscending); }
- (BOOL)isLaterThanDate:(NSDate *)aDate { return ([self compare:aDate] == NSOrderedDescending); }
// Thanks, markrickert
- (BOOL)isInFuture { return ([self isLaterThanDate:[NSDate date]]); }
// Thanks, markrickert
- (BOOL)isInPast { return ([self isEarlierThanDate:[NSDate date]]); }
#pragma mark - Roles
- (BOOL)isTypicallyWeekend
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components = [[NSDate currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitMonth fromDate:self];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) || (components.weekday == 7)) return YES;
    return NO;
}

- (BOOL)isTypicallyWorkday { return ![self isTypicallyWeekend]; }
#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *)dateByAddingYears:(NSInteger)dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateBySubtractingYears:(NSInteger)dYears { return [self dateByAddingYears:-dYears]; }
- (NSDate *)dateByAddingMonths:(NSInteger)dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateBySubtractingMonths:(NSInteger)dMonths { return [self dateByAddingMonths:-dMonths]; }
// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *)dateByAddingDays:(NSInteger)dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateBySubtractingDays:(NSInteger)dDays { return [self dateByAddingDays:(dDays * -1)]; }
- (NSDate *)dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateBySubtractingHours:(NSInteger)dHours { return [self dateByAddingHours:(dHours * -1)]; }
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes { return [self dateByAddingMinutes:(dMinutes * -1)]; }
- (NSDateComponents *)componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime =
        [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *)dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *)dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];

    components.hour = 23;  // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger)minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_DAY);
}

- (NSInteger)daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)distanceDaysToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components = [[NSDate currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =
        [[NSDate currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif

    return components.day;
}
- (NSInteger)distanceMonthsToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components =
            [[NSDate currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components =
            [[NSDate currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =
        [[NSDate currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.month;
}
- (NSInteger)distanceYearsToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components =
            [[NSDate currentCalendar] components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components =
            [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =
        [[NSDate currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.year;
}
#pragma mark Decomposing Dates
- (NSInteger)nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
    {
        components = [[NSDate currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}
- (NSInteger)hour
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.hour;
}

- (NSInteger)minute
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.minute;
}

- (NSInteger)seconds
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.second;
}

- (NSInteger)day
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.day;
}

- (NSInteger)month
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.month;
}

- (NSInteger)week
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger)weekday
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekday;
}

- (NSInteger)nthWeekday  // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)year
{
    NSDateComponents *components = [[NSDate currentCalendar] components:NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.year;
}
@end

