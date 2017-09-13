//
//  CICUIViewConstructor.h
//  Demo
//
//  Created by ManoBoo on 12/09/2017.
//  Copyright © 2017 ManoBoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CIComponentKitMacros.h"

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


- (instancetype)initWithComponent:(T)component;

@end


CIUIExtension(UIView, CICUIViewConstructor)
