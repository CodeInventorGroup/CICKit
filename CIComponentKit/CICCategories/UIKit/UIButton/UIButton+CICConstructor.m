//
//  UIButton+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIButton+CICConstructor.h"

@interface CICUIButtonConstructor ()

@property (nonatomic, weak) UIButton *component;

@end

@implementation CICUIButtonConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {

    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    
    _title = ^CICUIButtonConstructor *(NSString *title) {
        [weakSelf.component setTitle:title forState:UIControlStateNormal];
        return weakSelf;
    };
    
    _titleColor = ^CICUIButtonConstructor *(UIColor *color) {
        [weakSelf.component setTitleColor:color forState:UIControlStateNormal];
        return weakSelf;
    };
    
    _titleColorWithState = ^CICUIButtonConstructor *(UIColor *color, UIControlState state) {
        [weakSelf.component setTitleColor:color forState:state];
        return weakSelf;
    };
    
    _font = ^CICUIButtonConstructor *(UIFont *font) {
        weakSelf.component.titleLabel.font = font;
        return weakSelf;
    };
    
    _image = ^CICUIButtonConstructor *(NSString *imageName) {
        [weakSelf.component setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return weakSelf;
    };
    
    _imageWithState = ^CICUIButtonConstructor *(NSString *imageName, UIControlState state) {
        [weakSelf.component setImage:[UIImage imageNamed:imageName] forState:state];
        return weakSelf;
    };
    
    _addTarget = ^CICUIButtonConstructor *(id target, SEL action) {
        [weakSelf.component addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return weakSelf;
    };
}

@end

@implementation UIButton (CICConstructor)

- (CICUIButtonConstructor *)cic {

    return [[CICUIButtonConstructor alloc] initWithComponent:self];
}

@end
