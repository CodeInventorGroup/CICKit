//
//  CIBasicConstants.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#ifndef CIBasicConstants_h
#define CIBasicConstants_h

#define CI_SCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
#define CI_SCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height

#define CI_STATUSBAR_HEIGHT             20
#define CI_NAVIGATIONBAR_HEIGHT         44
#define CI_TABBAR_HEIGHT                49
#define CI_VIEW_HEIGHT                  (CI_SCREEN_HEIGHT - CI_STATUSBAR_HEIGHT - CI_NAVIGATIONBAR_HEIGHT)

// 计算text的size大小
#define CI_BOUNDINGSIZE_TEXT(maxSize, text, font) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero

#endif /* CIBasicConstants_h */
