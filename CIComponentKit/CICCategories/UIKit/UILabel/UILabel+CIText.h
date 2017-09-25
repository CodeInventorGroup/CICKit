//
//  UILabel+CIText.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+CICConstructor.h"

@interface UILabel (CIText)

/// 单行label设置text,修改frame宽度
- (void)cic_labelSingleLineWithText:(NSString *)text;

@end
