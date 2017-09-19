//
//  NSDate+CICString.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "NSDate+CICString.h"

@implementation NSDate (CICString)

/// 转换Date为指定样式的string
- (NSString *)cic_convertDateWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:self];
}

@end
