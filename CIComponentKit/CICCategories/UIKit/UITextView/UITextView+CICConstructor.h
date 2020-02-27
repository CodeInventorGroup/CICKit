//
//  UITextView+CICConstructor.h
//  CICKit
//
//  Created by NEWWORLD on 2020/2/27.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICUITextViewConstructor : CICUIViewConstructor

CICConstructorBasicProperties(CICUITextViewConstructor)

CICConstructorProperty(CICUITextViewConstructor, font, UIFont *font)
CICConstructorProperty(CICUITextViewConstructor, delegate, id<UITextViewDelegate> delegate)
CICConstructorProperty(CICUITextViewConstructor, textColor, UIColor *textColor)
CICConstructorProperty(CICUITextViewConstructor, textAlignment, NSTextAlignment textAlignment)
CICConstructorProperty(CICUITextViewConstructor, text, NSString *text)

@end

@interface UITextView (CICConstructor)

- (CICUIViewConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
