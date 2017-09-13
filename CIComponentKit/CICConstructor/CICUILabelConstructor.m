//
//  UILabel+Extension.m
//  Demo
//
//  Created by ManoBoo on 11/09/2017.
//  Copyright © 2017 ManoBoo. All rights reserved.
//

#import "CICUILabelConstructor.h"


@interface CICUILabelConstructor ()

@property (nonatomic, weak) UILabel *component;

@end

@implementation CICUILabelConstructor

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
    __weak typeof(self) weakSelf = self;
    
    _text = ^CICUILabelConstructor *(NSString *string) {
        weakSelf.component.text = string;
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


@end


CIUIImplementation(UILabel, CICUILabelConstructor)

