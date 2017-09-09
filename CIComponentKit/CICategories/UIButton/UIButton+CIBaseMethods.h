//
//  UIButton+CIBaseMethods.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CIBaseMethods)

/// 纯图片button实例(点击事件:UIControlEventTouchUpInside)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                         imageName:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action;

/// 纯图片button实例
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                         imageName:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents;

/// 纯文字button实例(不设置背景色、圆角、边框、点击事件:UIControlEventTouchUpInside)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                            target:(id)target
                            action:(SEL)action;

/// 纯文字button实例(不设置圆角、边框)
+ (instancetype)ci_buttonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action
                  forControlEvents:(UIControlEvents)controlEvents;

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
                  forControlEvents:(UIControlEvents)controlEvents;

@end
