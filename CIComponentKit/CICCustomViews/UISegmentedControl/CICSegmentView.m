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
    
    WEAK_SELF;
    _items = ^CICSegmentViewConstructor *(NSArray *items) {
        weakSelf.component.items = items;
        return weakSelf;
    };
    
    _font = ^CICSegmentViewConstructor *(UIFont *font) {
        weakSelf.component.font = font;
        return weakSelf;
    };
    
    _normalTextColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.normalTextColor = color;
        return weakSelf;
    };
    
    _selectedTextColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.selectedTextColor = color;
        return weakSelf;
    };
    
    _normalColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.normalColor = color;
        return weakSelf;
    };
    
    _selectedColor = ^CICSegmentViewConstructor *(UIColor *color) {
        weakSelf.component.selectedColor = color;
        return weakSelf;
    };
    
    _selectedIndex = ^CICSegmentViewConstructor *(NSInteger selectedIndex) {
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
/// 设置items之前必须先设置基本属性
- (void)setItems:(NSArray *)items {
    
    _items = items;
    
    CGFloat buttonWidth = CGRectGetWidth(self.frame)/(items.count * 1.0);
    CGFloat buttonHeight = CGRectGetHeight(self.frame);
    
    for (NSString *title in items) {
        NSInteger index = [items indexOfObject:title];
        UIButton *button = [[UIButton alloc] init];
        button.cic.frame(CGRectMake(buttonWidth * index, 0, buttonWidth, buttonHeight))
                  .title(title)
                  .tag(kSegmentViewButtonTagMargin + index)
                  .font(self.font)
                  .titleColorWithState(self.normalTextColor, UIControlStateNormal)
                  .addTarget(self, @selector(selectItemButton:))
                  .clipToBounds(YES);
        [self addSubview:button];
    }    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    _selectedIndex = selectedIndex;
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subView;
            NSInteger index = button.tag - kSegmentViewButtonTagMargin;
            button.cic.backgroundColor(self.selectedIndex == index ? self.selectedColor : self.normalColor)
                      .titleColor(self.selectedIndex == index ? self.selectedTextColor : self.normalTextColor)
                      .titleColorWithState(self.selectedIndex == index ? self.selectedTextColor : self.normalTextColor, UIControlStateHighlighted);
        }
    }
}

- (void)selectItemButton:(UIButton *)button {

    if (self.selectedIndex == button.tag - kSegmentViewButtonTagMargin) {
        return;
    }
    
    self.selectedIndex = button.tag - kSegmentViewButtonTagMargin;
    
    if (self.selectedItemBlock) {
        self.selectedItemBlock(button.tag - kSegmentViewButtonTagMargin);
    }
}

@end
