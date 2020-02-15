//
//  UIView+CICGradientColor.h
//  CICKit
//
//  Created by NEWWORLD on 2020/2/15.
//  Copyright © 2020 codeinventor. All rights reserved.
//  渐变色
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CICColorGradientDirection) {
    CICColorGradientDirectionLeftToRight = 0,
    CICColorGradientDirectionRightToLeft,
    CICColorGradientDirectionTopToBottom,
    CICColorGradientDirectionBottomToTop
};

@interface UIView (CICGradientColor)

- (CAGradientLayer *)cic_addGradientColor:(NSArray *)colors gradientColorDirection:(CICColorGradientDirection)direction;
- (CAGradientLayer *)cic_addGradientColor:(NSArray *)colors gradientColorDirection:(CICColorGradientDirection)direction locations:(NSArray<NSNumber *> *)locations;

@end

NS_ASSUME_NONNULL_END
