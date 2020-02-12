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

@interface CICTextFieldContructor<UITextField> : CICUIViewConstructor

CICConstructorBasicProperties(CICTextFieldContructor)

CICConstructorProperty(CICTextFieldContructor, placeholder, NSString *placeholder)

CICConstructorProperty(CICTextFieldContructor, text, NSString *text)

CICConstructorProperty(CICTextFieldContructor, font, UIFont *font)



@end

@interface UITextField (CICConstructor)

@end

NS_ASSUME_NONNULL_END
