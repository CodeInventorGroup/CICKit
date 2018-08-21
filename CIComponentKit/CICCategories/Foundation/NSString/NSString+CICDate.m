//
//  NSString+CICDate.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "NSString+CICDate.h"
#import "NSDate+CICString.h"

@implementation NSString (CICDate)

/// 转换字符串日期为NSDate标准类型
- (NSDate *)cic_convertStringForDateTypeWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter dateFromString:self];
}

/// 将存储Int类型的时间转换为日期格式
- (NSDate *)cic_convertIntTypeDateForDate {
    
    return [NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000];
}

/// 将存储Int类型的时间转换为 所需格式的时间string
- (NSString *)cic_convertIntTypeDateForStringWithDateFormat:(NSString *)dateFormat {
    
    NSDate *date = [self cic_convertIntTypeDateForDate];
    return [date cic_convertDateForStringWithDateFormat:dateFormat];
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/SuZhou"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

+ (BOOL)isChines:(NSString *)str
{
    NSInteger count = str.length;
    NSInteger result = 0;
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)//判断输入的是否是中文
        {
            result++;
        }
    }
    if (count == result) {//当字符长度和中文字符长度相等的时候
        return YES;
    }
    return NO;
}

+ (NSString *)toChinesPinYin:(NSString *)str
{
    NSMutableString *pinyin = [str mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    NSString *ss = [pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [ss lowercaseString];
}

@end
