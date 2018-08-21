//
//  NSNumber+DWWordFigure.m
//  DistanceWay
//
//  Created by NEWWORLD on 2017/11/10.
//  Copyright © 2017年 codeinventor. All rights reserved.
//  

#import "NSNumber+DWWordFigure.h"

@implementation NSNumber (DWWordFigure)

/// 将数字转换为大写数字(12345 ——> 一二三四五)
- (NSString *)cic_convertNumberToWordFigure {
    
    //  设置数据格式
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //  中国区应用
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [formatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    [formatter setMaximumFractionDigits:0];
    [formatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];

    return [formatter stringFromNumber:self];
}

@end
