//
//  UIView+CICGradientColor.m
//  CICKit
//
//  Created by NEWWORLD on 2020/2/15.
//  Copyright © 2020 codeinventor. All rights reserved.
//  渐变色
//

#import "UIView+CICGradientColor.h"

@implementation UIView (CICGradientColor)

- (CAGradientLayer *)cic_addGradientColor:(NSArray *)colors gradientColorDirection:(CICColorGradientDirection)direction {
    return [self cic_addGradientColor:colors gradientColorDirection:direction locations:@[@0.0, @1.0]];
}

- (CAGradientLayer *)cic_addGradientColor:(NSArray *)colors gradientColorDirection:(CICColorGradientDirection)direction locations:(NSArray<NSNumber *> *)locations {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    switch (direction) {
        case CICColorGradientDirectionLeftToRight:
            gradient.startPoint = CGPointMake(0, 0);
            gradient.endPoint = CGPointMake(1, 0);
            break;
        case CICColorGradientDirectionRightToLeft:
            gradient.startPoint = CGPointMake(1, 0);
            gradient.endPoint = CGPointMake(0, 0);
            break;
        case CICColorGradientDirectionTopToBottom:
            gradient.startPoint = CGPointMake(0, 0);
            gradient.endPoint = CGPointMake(0, 1);
            break;
        case CICColorGradientDirectionBottomToTop:
            gradient.startPoint = CGPointMake(0, 1);
            gradient.endPoint = CGPointMake(0, 0);
            break;
    }
    gradient.locations = locations;
    gradient.frame = self.bounds;
    gradient.colors = colors;
    [self.layer insertSublayer:gradient atIndex:0];
    return gradient;
}

@end
