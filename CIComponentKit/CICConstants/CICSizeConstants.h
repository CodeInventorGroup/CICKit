//
//  CICSizeConstants.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#ifndef CICSizeConstants_h
#define CICSizeConstants_h

#define CIC_SCREEN_WIDTH                 [UIScreen mainScreen].bounds.size.width
#define CIC_SCREEN_HEIGHT                [UIScreen mainScreen].bounds.size.height

#define CIC_STATUSBAR_HEIGHT             20
#define CIC_NAVIGATIONBAR_HEIGHT         44
#define CIC_TABBAR_HEIGHT                49
#define CIC_VIEW_HEIGHT                  (CIC_SCREEN_HEIGHT - CIC_STATUSBAR_HEIGHT - CIC_NAVIGATIONBAR_HEIGHT)

// 计算text的size大小
#define CIC_BOUNDINGSIZE_TEXT(maxSize, text, font) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero

#endif /* CICSizeConstants_h */
