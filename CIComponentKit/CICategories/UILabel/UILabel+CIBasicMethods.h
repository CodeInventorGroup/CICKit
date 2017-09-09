//
//  UILabel+CIBasicMethods.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CIBasicMethods)

/// 默认左对齐、文本为空Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font;

/// 默认左对齐Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                             text:(NSString *)text;

/// 文本为空Label实例
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment;

/// 创建Label实例基本方法
+ (instancetype)ci_labelWithFrame:(CGRect)frame
                        textColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment
                             text:(NSString *)text;
@end
