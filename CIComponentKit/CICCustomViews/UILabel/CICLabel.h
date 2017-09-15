//  自定义UILabel 支持长按复制
//  CICLabel.h
//  CIComponentKit
//
//  Created by ManoBoo on 15/09/2017.
//  Copyright © 2017 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+CICConstructor.h"

#define NotEmptyString(string) (string != nil && string.length > 0)

typedef enum : NSUInteger {
    CICLabelLongPressNone,
    CICLabelLongPressCopy,
    CICLabelLongPressOther,
} CICLabelLongPress;

@class CICLabelConstructor;

@interface CICLabel : UILabel

/// 文字上下左右的边距
@property (nonatomic, assign) UIEdgeInsets contentEdgeInset;

/// 长按操作
@property (nonatomic, assign) CICLabelLongPress longPress;

/// 长按操作复制的范围
@property (nonatomic, assign) NSRange copyRange;

/// 提供长按操作时的高亮背景颜色
@property (nonatomic, strong) UIColor *highlightedBackgroundColor;

- (CICLabelConstructor *)cic;

@end


@interface CICLabelConstructor<CICLabel> : CICUILabelConstructor

CICConstructorUILabelBasicProperties(CICLabelConstructor)

CICConstructorProperty(CICLabelConstructor, contentEdgeInset, UIEdgeInsets insets)

CICConstructorProperty(CICLabelConstructor, longPress, CICLabelLongPress longPress)

CICConstructorProperty(CICLabelConstructor, copyRange, NSRange copyRange)

CICConstructorProperty(CICLabelConstructor, highlightedBackgroundColor, UIColor *color)


@end
