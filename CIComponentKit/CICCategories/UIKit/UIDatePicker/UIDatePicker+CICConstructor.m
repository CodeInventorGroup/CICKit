//
//  UIDatePicker+CICConstructor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIDatePicker+CICConstructor.h"

@interface CICUIDatePickerConstructor ()

@property (nonatomic, weak) UIDatePicker *component;

@end

@implementation CICUIDatePickerConstructor

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
    
    self.date = ^CICUIDatePickerConstructor *(NSDate *date) {
        
        weakSelf.component.date = date;
        return weakSelf;
    };
}

@end

@implementation UIDatePicker (CICConstructor)

- (CICUIDatePickerConstructor *)cic {
    
    return [[CICUIDatePickerConstructor alloc] initWithComponent:self];
}

@end
