//
//  UILabel+CIText.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UILabel+CIText.h"

@implementation UILabel (CIText)

/// 单行label设置text,修改frame宽度
- (void)cic_labelSingleLineWithText:(NSString *)text {

    self.text = text;
    CGSize size = CIC_BOUNDINGSIZE_TEXT(CGSizeMake(CIC_SCREEN_WIDTH, FLT_MAX), text, self.font);
    self.cic.width(size.width);
}

@end
