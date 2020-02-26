//
//  UIButton+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

@interface CICUIButtonConstructor<UIButton> : CICUIViewConstructor

CICConstructorBasicProperties(CICUIButtonConstructor)

CICConstructorProperty(CICUIButtonConstructor, title, NSString *title)

CICConstructorProperty(CICUIButtonConstructor, titleColor, UIColor *color)

CICConstructorProperty(CICUIButtonConstructor, titleColorWithState, UIColor *color, UIControlState state)

CICConstructorProperty(CICUIButtonConstructor, font, UIFont *font)

CICConstructorProperty(CICUIButtonConstructor, image, NSString *imageName)

CICConstructorProperty(CICUIButtonConstructor, imageWithState, NSString *imageName, UIControlState state)

CICConstructorProperty(CICUIButtonConstructor, backgroundImageWithState, UIImage *image, UIControlState state)

CICConstructorProperty(CICUIButtonConstructor, addTarget, id target, SEL action)

@end

@interface UIButton (CICConstructor)

- (CICUIButtonConstructor *)cic;

@end
