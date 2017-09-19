//
//  NSDate+CICString.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CICString)

/// 转换Date为指定样式的string
- (NSString *)cic_convertDateWithDateFormat:(NSString *)dateFormat;

@end
