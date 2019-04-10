//
//  CICSizeMacros.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIDevice+CICUtils.h"

#ifndef CICSizeMacros_h
#define CICSizeMacros_h

#define CIC_SCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
#define CIC_SCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height

#define ZERO_ORIGIN                      0

#define CIC_STATUSBAR_HEIGHT             ([UIDevice isNotchScreen]? 44 :  20)
#define CIC_NAVIGATIONBAR_HEIGHT         44
#define CIC_VIEW_HEIGHT                  (CIC_SCREEN_HEIGHT - CIC_STATUSBAR_HEIGHT - CIC_NAVIGATIONBAR_HEIGHT)

#define CIC_BOTTOM_INDICATE_HEIGHT      ([UIDevice isNotchScreen] ? 34 : 0)
#define CIC_TAB_BAR_HEIGHT              49
#define CIC_SEPARATOR_LINE_SIZE         0.5

// 计算text的size大小
#define CIC_BOUNDINGSIZE_TEXT(maxSize, text, font) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero

#endif /* CICSizeMacros_h */
