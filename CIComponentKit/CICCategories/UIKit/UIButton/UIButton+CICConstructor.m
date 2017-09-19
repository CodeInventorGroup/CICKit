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

@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;
@dynamic centerX;
@dynamic centerY;
@dynamic center;
@dynamic size;
@dynamic frame;
@dynamic backgroundColor;

- (void)buildConstructor {

    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    
    self.title = ^CICUIButtonConstructor *(NSString *title) {
        [weakSelf.component setTitle:title forState:UIControlStateNormal];
        return weakSelf;
    };
    
    self.titleColor = ^CICUIButtonConstructor *(UIColor *color) {
        [weakSelf.component setTitleColor:color forState:UIControlStateNormal];
        return weakSelf;
    };
    
    self.font = ^CICUIButtonConstructor *(UIFont *font) {
        weakSelf.component.titleLabel.font = font;
        return weakSelf;
    };
    
    self.image = ^CICUIButtonConstructor *(NSString *imageName) {
        [weakSelf.component setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return weakSelf;
    };
    
    self.cornerRadius = ^CICUIButtonConstructor *(CGFloat cornerRadius) {
        weakSelf.component.layer.cornerRadius = cornerRadius;
        return weakSelf;
    };
    
    self.borderWidth = ^CICUIButtonConstructor *(CGFloat borderWidth) {
        weakSelf.component.layer.borderWidth = borderWidth;
        return weakSelf;
    };
    
    self.borderColor = ^CICUIButtonConstructor *(UIColor *color) {
        weakSelf.component.layer.borderColor = color.CGColor;
        return weakSelf;
    };
    
    self.masksToBounds = ^CICUIButtonConstructor *(BOOL isMasksToBounds) {
        weakSelf.component.layer.masksToBounds = isMasksToBounds;
        return weakSelf;
    };
    
    self.addTarget = ^CICUIButtonConstructor *(id target, SEL action) {
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
