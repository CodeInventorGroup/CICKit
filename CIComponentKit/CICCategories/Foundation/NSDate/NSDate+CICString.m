//
//  NSDate+CICString.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "NSDate+CICString.h"

@implementation NSDate (CICString)

/// 计算两个日期之间的天数
+ (NSInteger)calculateDaysFromBeginDate:(NSDate *)beginDate endDate:(NSDate *)endDate {
    
    NSTimeInterval time = [endDate timeIntervalSinceDate:beginDate];
    int days = ((int)time)/(3600*24);
    return days;
}

/// 转换Date为指定样式的string
- (NSString *)cic_convertDateForStringWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:self];
}

/// 转换Date为Int类型(以string存储Int类型)
- (NSString *)cic_convertDateForIntType {
    
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", (long)timeInterval];
}

@end
