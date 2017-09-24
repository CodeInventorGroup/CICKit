//
//  CICSegmentView.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/23.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICSegmentView.h"
#import "UIButton+CICConstructor.h"

#define kSegmentViewButtonTagMargin                 234

@interface CICSegmentViewConstructor ()

@property (nonatomic, weak) CICSegmentView *component;

@end

@implementation CICSegmentViewConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    self.items = ^CICSegmentViewConstructor *(NSArray *items) {
        weakSelf.component.items = items;
        return weakSelf;
    };
    
    self.font = ^CICSegmentViewConstructor *(UIFont *font) {
        weakSelf.component.font = font;
        return weakSelf;
    };
    
    self.normalTextColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.normalTextColor = color;
        return weakSelf;
    };
    
    self.selectedTextColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.selectedTextColor = color;
        return weakSelf;
    };
    
    self.normalColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.normalColor = color;
        return weakSelf;
    };
    
    self.selectedColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.selectedColor = color;
        return weakSelf;
    };
    
    self.cornerRadius = ^CICSegmentViewConstructor *(NSInteger cornerRadius) {
        weakSelf.component.cornerRadius = cornerRadius;
        return weakSelf;
    };
    
    self.selectedIndex = ^CICSegmentViewConstructor *(NSInteger selectedIndex) {
        weakSelf.component.selectedIndex = selectedIndex;
        return weakSelf;
    };
}

@end

@interface CICSegmentView ()

@end

@implementation CICSegmentView

- (CICSegmentViewConstructor *)cic {
    
    return [[CICSegmentViewConstructor alloc] initWithComponent:self];
}

#pragma mark - Setter Methods
/// 设置items之前必须先设置frame
- (void)setItems:(NSArray *)items {
    
    _items = items;
    
    CGFloat buttonWidth = CGRectGetWidth(self.frame)/(items.count * 1.0);
    
    for (NSString *title in items) {
        NSInteger index = [items indexOfObject:title];
        UIButton *button = [[UIButton alloc] init];
        button.cic.frame(CGRectMake(buttonWidth * index, 0, buttonWidth, CGRectGetHeight(self.frame)))
        .title(title)
        .tag(kSegmentViewButtonTagMargin + index);
        if (self.font) {
            button.cic.font(self.font);
        }
        [self addSubview:button];
    }
}

- (void)setFont:(UIFont *)font {
    
    _font = font;
}

@end
