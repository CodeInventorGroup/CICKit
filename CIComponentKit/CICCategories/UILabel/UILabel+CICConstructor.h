//
//  UILabel+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

@interface CICUILabelConstructor<UILabel> : CICUIViewConstructor

CICConstructorBasicProperties(CICUILabelConstructor)

//  UILabel的一些属性

CICConstructorProperty(CICUILabelConstructor, line, NSInteger num)

CICConstructorProperty(CICUILabelConstructor, textColor, UIColor *color)

CICConstructorProperty(CICUILabelConstructor, text, NSString *string)

CICConstructorProperty(CICUILabelConstructor, textAlignment, NSTextAlignment alignment)

@end

@interface UILabel (CICConstructor)

- (CICUILabelConstructor *)cic;

@end
