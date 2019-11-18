//
//  UISearchBar+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/23.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UISearchBar+CICConstructor.h"

@interface CICUISearchBarConstructor ()

@property (nonatomic, weak) UISearchBar *component;

@end

@implementation CICUISearchBarConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    _text = ^CICUISearchBarConstructor *(NSString *text) {
        weakSelf.component.text = text;
        return weakSelf;
    };
    
    _placeholder = ^CICUISearchBarConstructor *(NSString *placeholder) {
        weakSelf.component.placeholder = placeholder;
        return weakSelf;
    };
    
    _tintColor = ^CICUISearchBarConstructor *(UIColor *color) {
        weakSelf.component.tintColor = color;
        return weakSelf;
    };
    
    _barTintColor = ^CICUISearchBarConstructor *(UIColor *color) {
        weakSelf.component.barTintColor = color;
        return weakSelf;
    };
    
    _searchBarStyle = ^CICUISearchBarConstructor *(UISearchBarStyle style) {
        weakSelf.component.searchBarStyle = style;
        return weakSelf;
    };
    
    _delegate = ^CICUISearchBarConstructor *(id<UISearchBarDelegate> delegate) {
        weakSelf.component.delegate = delegate;
        return weakSelf;
    };
    
    _backgroundImage = ^CICUISearchBarConstructor *(UIImage *image) {
        weakSelf.component.backgroundImage = image;
        return weakSelf;
    };
}

@end

@implementation UISearchBar (CICConstructor)

- (CICUISearchBarConstructor *)cic {
    
    return [[CICUISearchBarConstructor alloc] initWithComponent:self];
}

@end
