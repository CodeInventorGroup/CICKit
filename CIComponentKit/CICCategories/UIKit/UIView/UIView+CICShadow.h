//
//  UIView+CICShadow.h
//  CICKit
//
//  Created by NEWWORLD on 2020/2/27.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CICShadowLocationType) {
    CICShadowLocationTypeTop = 0,
    CICShadowLocationTypeBottom,
    CICShadowLocationTypeLeft,
    CICShadowLocationTypeRight,
    CICShadowLocationTypeAround
};

@interface UIView (CICShadow)

- (void)cic_addShadowWithColor:(UIColor *)shadowColor
                 shadowOpacity:(CGFloat)shadowOpacity
                  shadowRadius:(CGFloat)shadowRadius
                shadowPathType:(CICShadowLocationType)shadowPathType
               shadowPathWidth:(CGFloat)shadowPathWidth;

@end

NS_ASSUME_NONNULL_END
