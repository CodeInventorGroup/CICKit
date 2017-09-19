//
//  UILabel+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UILabel+CICConstructor.h"

@interface CICUILabelConstructor ()

@property (nonatomic, weak) UILabel *component;

@end

@implementation CICUILabelConstructor

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
    _text = ^CICUILabelConstructor *(NSString *text) {
        weakSelf.component.text = text;
        return weakSelf;
    };
    
    _line = ^CICUILabelConstructor *(NSInteger num) {
        weakSelf.component.numberOfLines = num;
        return weakSelf;
    };
    
    _textColor = ^CICUILabelConstructor *(UIColor *color) {
        weakSelf.component.textColor = color;
        return weakSelf;
    };
    
    _textAlignment = ^CICUILabelConstructor *(NSTextAlignment alignment) {
        weakSelf.component.textAlignment = alignment;
        return weakSelf;
    };
}

- (void)dealloc {
    NSLog(@"CICUILabelConstructor dealloc");
}

@end

@implementation UILabel (CICConstructor)

- (CICUILabelConstructor *)cic {

    return [[CICUILabelConstructor alloc] initWithComponent:self];
}

@end
