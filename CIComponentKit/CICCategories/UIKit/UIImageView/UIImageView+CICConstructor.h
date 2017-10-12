//
//  UIImageView+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIView+CICConstructor.h"

@interface CICUIImageViewConstructor<UIImageView> : CICUIViewConstructor

CICConstructorBasicProperties(CICUIImageViewConstructor)

CICConstructorProperty(CICUIImageViewConstructor, imageName, NSString *imageName)

CICConstructorProperty(CICUIImageViewConstructor, contentMode, UIViewContentMode contentMode)

CICConstructorProperty(CICUIImageViewConstructor, userInteractionEnabled, BOOL userInteractionEnabled)

@end

@interface UIImageView (CICConstructor)

- (CICUIImageViewConstructor *)cic;

@end
