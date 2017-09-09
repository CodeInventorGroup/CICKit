//
//  UIButton+CIBaseMethods.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UIButton+CIBaseMethods.h"

@implementation UIButton (CIBaseMethods)

/// 纯图片button实例(点击事件:UIControlEventTouchUpInside)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                         imageName:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action {

    return [UIButton ci_buttonWithFrame:frame imageName:imageName target:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/// 纯图片button实例
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                         imageName:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents {

    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}

/// 纯文字button实例(不设置背景色、圆角、边框、点击事件:UIControlEventTouchUpInside)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                            target:(id)target
                            action:(SEL)action {

    return [UIButton ci_buttonWithFrame:frame title:title titleColor:titleColor font:font backgroundColor:nil target:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/// 纯文字button实例(不设置圆角、边框)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents {

    return [UIButton ci_buttonWithFrame:frame title:title titleColor:titleColor font:font backgroundColor:backgroundColor borderWidth:NAN borderColor:nil cornerRadius:NAN target:target action:action forControlEvents:controlEvents];
}

/// 纯文字button实例
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                       borderWidth:(CGFloat)borderWidth
                       borderColor:(UIColor *)borderColor
                      cornerRadius:(CGFloat)cornerRadius
                            target:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents {

    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    if (backgroundColor) {
        button.backgroundColor = backgroundColor;
    }
    
    if (!isnan(cornerRadius)) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    
    if (!isnan(borderWidth)) {
        button.layer.borderWidth = borderWidth;
    }
    
    if (borderColor) {
        button.layer.borderColor = borderColor.CGColor;
    }
    
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}

@end
