//
//  UIView+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/13.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CICConstructorMacros.h"
#import "CICFontMacros.h"
#import "CICSizeMacros.h"
#import "CICColorMacros.h"

@class CICUIViewConstructor;
@protocol CIUIViewConstructorProtocol <NSObject>
    
@required
    
- (void)buildConstructor;
    
@end

@interface CICUIViewConstructor<T: __kindof UIView *> : NSObject <CIUIViewConstructorProtocol>

// UIView的一些基本属性

CICConstructorProperty(CICUIViewConstructor, x, CGFloat x)

CICConstructorProperty(CICUIViewConstructor, y, CGFloat y)

CICConstructorProperty(CICUIViewConstructor, width, CGFloat width)

CICConstructorProperty(CICUIViewConstructor, height, CGFloat height)

CICConstructorProperty(CICUIViewConstructor, size, CGSize size)

CICConstructorProperty(CICUIViewConstructor, centerX, CGFloat centerX)

CICConstructorProperty(CICUIViewConstructor, centerY, CGFloat centerY)

CICConstructorProperty(CICUIViewConstructor, center, CGPoint center)

CICConstructorProperty(CICUIViewConstructor, frame, CGRect frame)

CICConstructorProperty(CICUIViewConstructor, backgroundColor, UIColor *color)

CICConstructorProperty(CICUIViewConstructor, hidden, BOOL hidden)

CICConstructorProperty(CICUIViewConstructor, tag, NSInteger tag)

CICConstructorProperty(CICUIViewConstructor, cornerRadius, CGFloat cornerRadius)

CICConstructorProperty(CICUIViewConstructor, masksToBounds, BOOL masksToBounds)

CICConstructorProperty(CICUIViewConstructor, borderWidth, CGFloat borderWidth)

CICConstructorProperty(CICUIViewConstructor, borderColor, UIColor *borderColor)


- (instancetype)initWithComponent:(T)component;

@end

@interface UIView (CICConstructor)

- (CICUIViewConstructor *)cic;

@end
