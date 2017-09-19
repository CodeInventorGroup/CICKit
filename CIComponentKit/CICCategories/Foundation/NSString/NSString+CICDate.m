//
//  NSString+CICDate.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "NSString+CICDate.h"

@implementation NSString (CICDate)

- (NSDate *)cic_convertDateWithDateFormat:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter dateFromString:self];
}

@end
