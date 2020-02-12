//
//  UITextField+CICConstructor.m
//  CICKit
//
//  Created by NEWWORLD on 2020/2/12.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import "UITextField+CICConstructor.h"

@interface CICUITextFieldContructor ()

@property (nonatomic, weak) UITextField *component;

@end

@implementation CICUITextFieldContructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    
    [super buildConstructor];
    
    WEAK_SELF;
    _placeholder = ^CICUITextFieldContructor *(NSString *placeholder) {
        weakSelf.component.placeholder = placeholder;
        return weakSelf;
    };
    
    _attributedPlaceholder = ^CICUITextFieldContructor *(NSAttributedString *attributedPlaceholder) {
        weakSelf.component.attributedPlaceholder = attributedPlaceholder;
        return weakSelf;
    };
    
    _text = ^CICUITextFieldContructor *(NSString *text) {
        weakSelf.component.text = text;
        return weakSelf;
    };
    
    _textColor = ^CICUITextFieldContructor *(UIColor *textColor) {
        weakSelf.component.textColor = textColor;
        return weakSelf;
    };
    
    _font = ^CICUITextFieldContructor *(UIFont *font) {
        weakSelf.component.font = font;
        return weakSelf;
    };
    
    _delegate = ^CICUITextFieldContructor *(id <UITextFieldDelegate> delegate) {
        weakSelf.component.delegate = delegate;
        return weakSelf;
    };

    _leftView = ^CICUITextFieldContructor *(UIView *leftView) {
        weakSelf.component.leftView = leftView;
        return weakSelf;
    };
    
    _leftViewMode = ^CICUITextFieldContructor *(UITextFieldViewMode leftViewMode) {
        weakSelf.component.leftViewMode = leftViewMode;
        return weakSelf;
    };
    
    _rightView = ^CICUITextFieldContructor *(UIView *rightView) {
        weakSelf.component.rightView = rightView;
        return weakSelf;
    };
    
    _rightViewMode = ^CICUITextFieldContructor *(UITextFieldViewMode rightViewMode) {
        weakSelf.component.rightViewMode = rightViewMode;
        return weakSelf;
    };
}

@end

@implementation UITextField (CICConstructor)

- (CICUITextFieldContructor *)cic {
    return [[CICUITextFieldContructor alloc] initWithComponent:self];
}

@end
