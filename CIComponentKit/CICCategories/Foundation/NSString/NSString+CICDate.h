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
- (NSDate *)cic_convertDateWithDateFormat:(NSString *)dateFormat;

@end
