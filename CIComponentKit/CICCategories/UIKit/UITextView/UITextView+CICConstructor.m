//
//  UITextView+CICConstructor.m
//  CICKit
//
//  Created by NEWWORLD on 2020/2/27.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import "UITextView+CICConstructor.h"

@interface CICUITextViewConstructor ()

@property (nonatomic, weak) UITextView *component;

@end

@implementation CICUITextViewConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    [super buildConstructor];
    
    WEAK_SELF;
    _text = ^CICUITextViewConstructor *(NSString *text) {
        weakSelf.component.text = text;
        return weakSelf;
    };
    
    _font = ^CICUITextViewConstructor *(UIFont *font) {
        weakSelf.component.font = font;
        return weakSelf;
    };
    
    _textAlignment = ^CICUITextViewConstructor *(NSTextAlignment alignment) {
        weakSelf.component.textAlignment = alignment;
        return weakSelf;
    };
    
    _delegate = ^CICUITextViewConstructor *(id<UITextViewDelegate> delegate) {
        weakSelf.component.delegate = delegate;
        return weakSelf;
    };
    
    _textColor = ^CICUITextViewConstructor *(UIColor *textColor) {
        weakSelf.component.textColor = textColor;
        return weakSelf;
    };
}

@end

@implementation UITextView (CICConstructor)

- (CICUIViewConstructor *)cic {
    return [[CICUITextViewConstructor alloc] initWithComponent:self];
}

@end
