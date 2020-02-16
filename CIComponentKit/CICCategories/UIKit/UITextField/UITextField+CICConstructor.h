//
//  UITextField+CICConstructor.h
//  CICKit
//
//  Created by NEWWORLD on 2020/2/12.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICUITextFieldContructor<UITextField> : CICUIViewConstructor

CICConstructorBasicProperties(CICUITextFieldContructor)

CICConstructorProperty(CICUITextFieldContructor, placeholder, NSString *placeholder)

CICConstructorProperty(CICUITextFieldContructor, attributedPlaceholder, NSAttributedString *attributedPlaceholder)

CICConstructorProperty(CICUITextFieldContructor, text, NSString *text)

CICConstructorProperty(CICUITextFieldContructor, textColor, UIColor *textColor)

CICConstructorProperty(CICUITextFieldContructor, font, UIFont *font)

CICConstructorProperty(CICUITextFieldContructor, delegate, id<UITextFieldDelegate> delegate)

CICConstructorProperty(CICUITextFieldContructor, leftView, UIView *leftView)

CICConstructorProperty(CICUITextFieldContructor, leftViewMode, UITextFieldViewMode leftViewMode)

CICConstructorProperty(CICUITextFieldContructor, rightView, UIView *rightView)

CICConstructorProperty(CICUITextFieldContructor, rightViewMode, UITextFieldViewMode rightViewMode)

CICConstructorProperty(CICUITextFieldContructor, addTarget, id target, SEL action, UIControlEvents events)

@end

@interface UITextField (CICConstructor)

- (CICUITextFieldContructor *)cic;

@end

NS_ASSUME_NONNULL_END
