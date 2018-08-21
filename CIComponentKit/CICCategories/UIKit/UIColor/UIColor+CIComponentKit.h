//  UIColor的一些便利构造方法
//  UIColor+CIComponentKit.h
//  CIComponentKit
//
//  Created by ManoBoo on 2017/9/25.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    float red;
    float green;
    float blue;
    float alpha;
} CICColorBox;

#define CICColorMake(red,green,blue,alpha) ({                         \
[UIColor cic_srgbColorWithRed:red Green:green Blue:blue Aplha:alpha]; \
}) \

@interface UIColor (CIComponentKit)

/**
 返回一个随机rgb颜色
 */
+ (instancetype)cic_randomColor;


/**
 返回一个随机p3色域颜色 (iOS version >= 10.0)
 P3色彩覆盖度为 100%
 */
+ (instancetype)cic_p3RandomColor NS_AVAILABLE_IOS(10_0);


/**
 返回hexColor

 @param hexValue 类似于 0xFFFFFF
 @return hexColor
 */
+ (instancetype)cic_hexColor:(UInt32)hexValue;


/**
 返回hexColor
 
 @param hexValue 类似于 0xFFFFFF
 @param alpha 透明度
 @return hexColor
 */
+ (instancetype)cic_hexColor:(UInt32)hexValue alpha:(float)alpha;

/// srgb color
+ (instancetype)cic_srgbColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue Aplha:(CGFloat)alpha;

+ (instancetype)cic_srgbColorWithBox:(CICColorBox)box;

@end
