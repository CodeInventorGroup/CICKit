//
//  NSDate+CICString.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CICString)

/// 计算两个日期之间的天数
+ (NSInteger)calculateDaysFromBeginDate:(NSDate *)beginDate endDate:(NSDate *)endDate;

/// 转换Date为指定样式的string
- (NSString *)cic_convertDateForStringWithDateFormat:(NSString *)dateFormat;

/// 转换Date为Int类型(以string存储Int类型)
- (NSString *)cic_convertDateForIntType;

@end
