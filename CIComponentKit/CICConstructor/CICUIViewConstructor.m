//
//  CICUIViewConstructor.m
//  Demo
//
//  Created by ManoBoo on 12/09/2017.
//  Copyright © 2017 ManoBoo. All rights reserved.
//

#import "CICUIViewConstructor.h"

@interface CICUIViewConstructor ()

@property (nonatomic, weak) UIView *component;

@end

@implementation CICUIViewConstructor


- (instancetype)initWithComponent:(UIView *)component {
    self = [super init];
    if (self) {
        self.component = component;
        [self buildConstructor];
    }
    return self;
}

- (void)buildConstructor {
    __weak typeof(self) weakSelf = self;
    
    //MARK: - Layout
    _x = ^CICUIViewConstructor *(CGFloat x) {
        weakSelf.component.frame = CGRectSetX(weakSelf.component.frame, x);
        return weakSelf;
    };
    
    _y = ^CICUIViewConstructor *(CGFloat y) {
        weakSelf.component.frame = CGRectSetY(weakSelf.component.frame, y);
        return weakSelf;
    };
        
    _width = ^CICUIViewConstructor *(CGFloat width) {
        weakSelf.component.frame = CGRectSetWidth(weakSelf.component.frame, width);
        return weakSelf;
    };
    
    _height = ^CICUIViewConstructor *(CGFloat height) {
        weakSelf.component.frame = CGRectSetHeight(weakSelf.component.frame, height);
        return weakSelf;
    };
    
    _size = ^CICUIViewConstructor *(CGSize size) {
        weakSelf.component.frame = CGRectSetSize(weakSelf.component.frame, size);
        return weakSelf;
    };
    
    _centerX = ^CICUIViewConstructor *(CGFloat centerX) {
        weakSelf.component.center = CGPointMake(centerX, weakSelf.component.center.y);
        return weakSelf;
    };
    
    _centerY = ^CICUIViewConstructor *(CGFloat centerY) {
        weakSelf.component.center = CGPointMake(weakSelf.component.center.y, centerY);
        return weakSelf;
    };
    
    _center = ^CICUIViewConstructor *(CGPoint center) {
        weakSelf.component.center = center;
        return weakSelf;
    };
    
    _frame = ^CICUIViewConstructor *(CGRect rect) {
        weakSelf.component.frame = rect;
        return weakSelf;
    };
    //MARK: - Render
    _backgroundColor = ^CICUIViewConstructor *(UIColor *color) {
        weakSelf.component.backgroundColor = color;
        return weakSelf;
    };
}

@end

CIUIImplementation(UIView, CICUIViewConstructor)
