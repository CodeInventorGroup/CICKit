//
//  NSNumber+DWWordFigure.h
//  DistanceWay
//
//  Created by NEWWORLD on 2017/11/10.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (DWWordFigure)

/// 将数字转换为大写数字(12345 ——> 一二三四五)
- (NSString *)cic_convertNumberToWordFigure;

@end
