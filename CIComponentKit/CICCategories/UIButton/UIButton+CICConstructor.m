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

@dynamic component;
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
}

@end

@implementation UIButton (CICConstructor)

- (CICUIButtonConstructor *)cic {

    return [[CICUIButtonConstructor alloc] initWithComponent:self];
}

@end
