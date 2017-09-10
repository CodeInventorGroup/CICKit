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
- (void)ci_labelSingleLineWithText:(NSString *)text {

    self.text = text;
    CGSize size = CI_BOUNDINGSIZE_TEXT(CGSizeMake(CI_SCREEN_WIDTH, FLT_MAX), text, self.font);
    [self ci_adjustViewFrameWithWidth:size.width];
}

@end
