//
//  UILabel+CIBasicMethods.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 CIComponKitUILabelExtension UILabel的便捷链式语法
 */

@interface CIComponKitUILabelExtension: NSObject

@property (nonatomic, weak) UILabel *component;

@property (nonatomic, copy) CIComponKitUILabelExtension * (^frame)(CGRect num);

@property (nonatomic, copy) CIComponKitUILabelExtension * (^font)(UIFont *font);

@property (nonatomic, copy) CIComponKitUILabelExtension * (^line)(NSInteger num);

@property (nonatomic, copy) CIComponKitUILabelExtension * (^textColor)(UIColor *color);

@property (nonatomic, copy) CIComponKitUILabelExtension * (^text)(NSString *string);

@property (nonatomic, copy) CIComponKitUILabelExtension * (^textAlignment)(NSTextAlignment);

- (instancetype)initWithComponent:(UILabel *)label;

@end



@interface UILabel (CIBasicMethods)

- (CIComponKitUILabelExtension *)ci;

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


