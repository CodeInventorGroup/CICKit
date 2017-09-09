//
//  UILabel+CIBasicMethods.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UILabel+CIBasicMethods.h"

@implementation UILabel (CIBasicMethods)

/// 默认左对齐、文本为空Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font {

    return [UILabel ci_labelWithFrame:frame textColor:textColor font:font text:nil];
}

/// 默认左对齐Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                             text:(NSString *)text {

    return [UILabel ci_labelWithFrame:frame textColor:textColor font:font textAlignment:NSTextAlignmentLeft text:text];
}

/// 文本为空Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment {

    return [UILabel ci_labelWithFrame:frame textColor:textColor font:font textAlignment:textAlignment text:nil];
}

/// 创建Label实例基本方法
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString *)text {

    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    if (text && ![text isEqualToString:@""]) {
        label.text = text;
    }
    return label;
}

@end
