//
//  UIColor+CIComponentKit.m
//  CIComponentKit
//
//  Created by ManoBoo on 2017/9/25.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIColor+CIComponentKit.h"

@implementation UIColor (CIComponentKit)

CGFloat CGFloat255Random() {
    return arc4random_uniform(256)/255.0;
}


//MARK: - random color

+ (instancetype)cic_randomColor {
    return [UIColor colorWithRed:CGFloat255Random() green:CGFloat255Random() blue:CGFloat255Random() alpha:1.0];
}

+ (instancetype)cic_p3RandomColor {
    return [UIColor colorWithDisplayP3Red:CGFloat255Random() green:CGFloat255Random() blue:CGFloat255Random() alpha:1.0];
}


//MARK: - hex color

+ (instancetype)cic_hexColor:(UInt32)hexValue {
    return [UIColor cic_hexColor:hexValue alpha:1.0];
}

+ (instancetype)cic_hexColor:(UInt32)hexValue alpha:(float)alpha {
    CGFloat red = (CGFloat)((hexValue & 0xFF0000) >> 16) / 255.0;
    CGFloat green = (CGFloat)((hexValue & 0xFF00) >> 8) / 255.0;
    CGFloat blue = (CGFloat)(hexValue & 0xFF) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//MARK: - srgb color
+ (instancetype)cic_srgbColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Aplha:(CGFloat)alpha {
    if ([UIColor respondsToSelector:@selector(colorWithDisplayP3Red:green:blue:alpha:)]) {
        return [UIColor colorWithDisplayP3Red:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
    }
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (instancetype)cic_srgbColorWithBox:(CICColorBox)box {
    return [UIColor cic_srgbColorWithRed:box.red Green:box.green Blue:box.blue Aplha:box.alpha];
}

@end
