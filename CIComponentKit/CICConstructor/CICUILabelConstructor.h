//
//  UILabel+Extension.h
//  Demo
//
//  Created by ManoBoo on 11/09/2017.
//  Copyright © 2017 ManoBoo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CICUIViewConstructor.h"

@interface CICUILabelConstructor<UILabel>: CICUIViewConstructor

CICConstructorProperty(CICUILabelConstructor, x, CGFloat x)

CICConstructorProperty(CICUILabelConstructor, y, CGFloat y)

CICConstructorProperty(CICUILabelConstructor, width, CGFloat width)

CICConstructorProperty(CICUILabelConstructor, height, CGFloat height)

CICConstructorProperty(CICUILabelConstructor, size, CGSize size)

CICConstructorProperty(CICUILabelConstructor, centerX, CGFloat centerX)

CICConstructorProperty(CICUILabelConstructor, centerY, CGFloat centerY)

CICConstructorProperty(CICUILabelConstructor, center, CGPoint center)

CICConstructorProperty(CICUILabelConstructor, frame, CGRect frame)

CICConstructorProperty(CICUILabelConstructor, backgroundColor, UIColor *color)


// - UILabel -
CICConstructorProperty(CICUILabelConstructor, line, NSInteger num)

CICConstructorProperty(CICUILabelConstructor, textColor, UIColor *color)

CICConstructorProperty(CICUILabelConstructor, text, NSString *string)

CICConstructorProperty(CICUILabelConstructor, textAlignment, NSTextAlignment alignment)

@end



CIUIExtension(UILabel, CICUILabelConstructor)

// 这玩意就是 给UILabel 添加 .ci 方法

/*
 
 @interface UILabel (CICUILabelConstructor)
 
    - (CICUILabelConstructor *)ci;
 
 @end
 
*/
