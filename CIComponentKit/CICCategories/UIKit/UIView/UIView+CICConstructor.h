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
#import "UIView+CICSeparatorLine.h"

@class CICUIViewConstructor;
@protocol CIUIViewConstructorProtocol <NSObject>
    
@required
    
- (void)buildConstructor;
    
@end

@interface CICUIViewConstructor<T> : NSObject <CIUIViewConstructorProtocol>

CICConstructorBasicProperties(CICUIViewConstructor)

- (instancetype)initWithComponent:(T)component;

@end

@interface UIView (CICConstructor)

- (CICUIViewConstructor *)cic;

@end
