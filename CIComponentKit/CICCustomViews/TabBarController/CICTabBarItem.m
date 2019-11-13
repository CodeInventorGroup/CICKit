//
//  CICTabBarItem.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICTabBarItem.h"

@implementation CICTabBarItem

@end

@interface CICTabBarItemConstructor ()

@property (nonatomic, weak) CICTabBarItem *component;

@end

@implementation CICTabBarItemConstructor

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(self) weakSelf = self;
    self.controllerClassName = ^CICTabBarItemConstructor * _Nonnull(NSString * _Nonnull controllerClassName) {
        weakSelf.component.controllerClassName = controllerClassName;
        return weakSelf;
    };
    
    self.title = ^CICTabBarItemConstructor * _Nonnull(NSString * _Nonnull title) {
        weakSelf.component.title = title;
        return weakSelf;
    };
    
    self.normalImage = ^CICTabBarItemConstructor * _Nonnull(id  _Nonnull normalImage) {
        weakSelf.component.normalImage = normalImage;
        return weakSelf;
    };
    
    self.selectedImage = ^CICTabBarItemConstructor * _Nonnull(id  _Nonnull selectedImage) {
        weakSelf.component.selectedImage = selectedImage;
        return weakSelf;
    };
}

@end

@implementation CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic {
    
    return [[CICTabBarItemConstructor alloc] initWithComponent:self];
}

@end
