//
//  NSString+CICDate.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CICDate)

/// 转换字符串日期为NSDate标准类型
- (NSDate *)cic_convertStringForDateTypeWithDateFormat:(NSString *)dateFormat;
/// 将存储Int类型的时间转换为日期格式
- (NSDate *)cic_convertIntTypeDateForDate;
/// 将存储Int类型的时间转换为 所需格式的时间string
- (NSString *)cic_convertIntTypeDateForStringWithDateFormat:(NSString *)dateFormat;

/// 根据日期获取今天星期几
+ (NSString *)weekdayStringFromDate:(NSDate*)inputDate;

/// 判断是否是中文
+ (BOOL)isChines:(NSString *)str;

/// 将汉字转化成拼音
+ (NSString *)toChinesPinYin:(NSString *)str;

@end
