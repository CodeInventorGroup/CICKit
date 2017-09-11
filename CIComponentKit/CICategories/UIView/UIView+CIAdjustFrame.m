//
//  UIView+CIAdjustFrame.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UIView+CIAdjustFrame.h"

@implementation CIComponentKitUIViewExtension

- (instancetype)initWithComponent:(UIView *)component {

    if (self = [super init]) {
        self.component = component;
        [self buildView];
    }
    return self;
}

- (void)buildView {

    __weak typeof(&*self) weakSelf = self;
    self.x = ^CIComponentKitUIViewExtension *(CGFloat originX) {
        CGRect frame = weakSelf.component.frame;
        frame.origin.x = originX;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.y = ^CIComponentKitUIViewExtension *(CGFloat originY) {
        CGRect frame = weakSelf.component.frame;
        frame.origin.y = originY;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.width = ^CIComponentKitUIViewExtension *(CGFloat width) {
        CGRect frame = weakSelf.component.frame;
        frame.size.width = width;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.height = ^CIComponentKitUIViewExtension *(CGFloat height) {
        CGRect frame = weakSelf.component.frame;
        frame.size.height = height;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.centerX = ^CIComponentKitUIViewExtension *(CGFloat centerX) {
        CGRect frame = weakSelf.component.frame;
        frame.origin.x = centerX - CGRectGetWidth(frame)/2.0;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.centerY = ^CIComponentKitUIViewExtension *(CGFloat centerY) {
        CGRect frame = weakSelf.component.frame;
        frame.origin.y = centerY - CGRectGetHeight(frame)/2.0;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
    
    self.center = ^CIComponentKitUIViewExtension *(CGFloat centerX, CGFloat centerY) {
        CGRect frame = weakSelf.component.frame;
        frame.origin.x = centerX - CGRectGetWidth(frame)/2.0;
        frame.origin.y = centerY - CGRectGetHeight(frame)/2.0;
        weakSelf.component.frame = frame;
        return weakSelf;
    };
}
@end

@implementation UIView (CIAdjustFrame)

- (CIComponentKitUIViewExtension *)ci {
    
    return [[CIComponentKitUIViewExtension alloc] initWithComponent:self];
}

#pragma mark - Adjust Single Position
/// 修改view的原点x
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX {

    [self ci_adjustViewFrameWithOriginX:originX originY:NAN width:NAN height:NAN];
}

/// 修改view的原点y
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY {
    
    [self ci_adjustViewFrameWithOriginX:NAN originY:originY width:NAN height:NAN];
}

/// 修改view的宽度
- (void)ci_adjustViewFrameWithWidth:(CGFloat)width {
    
    [self ci_adjustViewFrameWithOriginX:NAN originY:NAN width:width height:NAN];
}

/// 修改view的高度
- (void)ci_adjustViewFrameWithHeight:(CGFloat)height {
    
    [self ci_adjustViewFrameWithOriginX:NAN originY:NAN width:NAN height:height];
}

#pragma mark - Adjust Two Positions
/// 修改view的原点x,y
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY {
    
    [self ci_adjustViewFrameWithOriginX:originX originY:originY width:NAN height:NAN];
}

/// 修改view的原点x,width
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX width:(CGFloat)width {
    
    [self ci_adjustViewFrameWithOriginX:originX originY:NAN width:width height:NAN];
}

/// 修改view的原点x,height
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX height:(CGFloat)height {
    
    [self ci_adjustViewFrameWithOriginX:originX originY:NAN width:NAN height:height];
}

/// 修改view的原点y,width
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY width:(CGFloat)width {
    
    [self ci_adjustViewFrameWithOriginX:NAN originY:originY width:width height:NAN];
}

/// 修改view的原点y,height
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY height:(CGFloat)height {

    [self ci_adjustViewFrameWithOriginX:NAN originY:originY width:NAN height:height];
}

/// 修改view的width,height
- (void)ci_adjustViewFrameWithWidth:(CGFloat)width height:(CGFloat)height {

    [self ci_adjustViewFrameWithOriginX:NAN originY:NAN width:width height:height];
}

#pragma mark - Adjust Three Positions
/// 修改view的原点x,y,width
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY width:(CGFloat)width {

    [self ci_adjustViewFrameWithOriginX:originX originY:originY width:width height:NAN];
}

/// 修改view的原点x,y,height
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY height:(CGFloat)height {

    [self ci_adjustViewFrameWithOriginX:originX originY:originY width:NAN height:height];
}

/// 修改view的原点y,width,height
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY width:(CGFloat)width height:(CGFloat)height {

    [self ci_adjustViewFrameWithOriginX:NAN originY:originY width:width height:height];
}

#pragma mark - Adjust All Positions
/// 修改view的frame
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY width:(CGFloat)width height:(CGFloat)height {

    CGRect AdjustedFrame = self.frame;
    if (!isnan(originX)) {
        AdjustedFrame.origin.x = originX;
    }
    
    if (!isnan(originY)) {
        AdjustedFrame.origin.y = originY;
    }
    
    if (!isnan(width)) {
        AdjustedFrame.size.width = width;
    }
    
    if (!isnan(height)) {
        AdjustedFrame.size.height = height;
    }
    self.frame = AdjustedFrame;
}

@end
