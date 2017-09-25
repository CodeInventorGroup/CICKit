//
//  UIImageView+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIImageView+CICConstructor.h"

@interface CICUIImageViewConstructor ()

@property (nonatomic, weak) UIImageView *component;

@end

@implementation CICUIImageViewConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {

    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    self.imageName = ^CICUIImageViewConstructor *(NSString *imageName) {
        weakSelf.component.image = [UIImage imageNamed:imageName];
        return weakSelf;
    };
    
    self.contentMode = ^CICUIImageViewConstructor *(UIViewContentMode contentMode) {
        weakSelf.component.contentMode = contentMode;
        return weakSelf;
    };
}

@end

@implementation UIImageView (CICConstructor)

- (CICUIImageViewConstructor *)cic {

    return [[CICUIImageViewConstructor alloc] initWithComponent:self];
}

@end
