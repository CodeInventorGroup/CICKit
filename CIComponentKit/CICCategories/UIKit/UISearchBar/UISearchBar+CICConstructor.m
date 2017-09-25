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
    self.text = ^CICUISearchBarConstructor *(NSString *text) {
        weakSelf.component.text = text;
        return weakSelf;
    };
    
    self.placeholder = ^CICUISearchBarConstructor *(NSString *placeholder) {
        weakSelf.component.placeholder = placeholder;
        return weakSelf;
    };
    
    self.tintColor = ^CICUISearchBarConstructor *(UIColor *color) {
        weakSelf.component.tintColor = color;
        return weakSelf;
    };
    
    self.barTintColor = ^CICUISearchBarConstructor *(UIColor *color) {
        weakSelf.component.barTintColor = color;
        return weakSelf;
    };
    
    self.searchBarStyle = ^CICUISearchBarConstructor *(UISearchBarStyle style) {
        weakSelf.component.searchBarStyle = style;
        return weakSelf;
    };
    
    self.delegate = ^CICUISearchBarConstructor *(id<UISearchBarDelegate> delegate) {
        weakSelf.component.delegate = delegate;
        return weakSelf;
    };
}

@end

@implementation UISearchBar (CICConstructor)

- (CICUISearchBarConstructor *)cic {
    
    return [[CICUISearchBarConstructor alloc] initWithComponent:self];
}

@end
