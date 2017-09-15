//
//  UILabel+CIBasicMethods.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UILabel+CIBasicMethods.h"

@implementation CIComponKitUILabelExtension

- (instancetype)initWithComponent:(UILabel *)label
{
    self = [super init];
    if (self) {
        self.component = label;
        [self buildExtensions];
    }
    return self;
}

- (void)buildExtensions {
    __weak typeof(self) weakSelf = self;
    
    _frame = ^CIComponKitUILabelExtension *(CGRect frame) {
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    _font = ^CIComponKitUILabelExtension *(UIFont *font){
        weakSelf.component.font = font;
        return weakSelf;
    };
    
    _text = ^CIComponKitUILabelExtension *(NSString *string) {
        weakSelf.component.text = string;
        return weakSelf;
    };
    
    _line = ^CIComponKitUILabelExtension *(NSInteger num) {
        weakSelf.component.numberOfLines = num;
        return weakSelf;
    };
    
    _textColor = ^CIComponKitUILabelExtension *(UIColor *color) {
        weakSelf.component.textColor = color;
        return weakSelf;
    };
    
    _textAlignment = ^CIComponKitUILabelExtension *(NSTextAlignment alignment) {
        weakSelf.component.textAlignment = alignment;
        return weakSelf;
    };
}

@end



/**
 UILabel (CIBasicMethods)
 */
@implementation UILabel (CIBasicMethods)

/// CIComponKitUILabelExtension UILabel的便捷链式语法
+ (CIComponKitUILabelExtension *)ci {
    return [[CIComponKitUILabelExtension alloc] initWithComponent:[[UILabel alloc] init]];
}

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


//TODO: ...
- (void)cic_adjustViewFrameWithWidth:(CGFloat)width {
    
}

//TODO: ...
- (void)cic_adjustViewFrameWithWidth:(CGFloat)width height:(CGFloat)height {
    
}

//TODO: ...
- (void)cic_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY {
    
}

@end
