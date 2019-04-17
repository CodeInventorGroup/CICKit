//
//  CICNumberKeyboardView.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  自定义数字键盘
//

#import "CICNumberKeyboardView.h"
#import "UIColor+CIComponentKit.h"
#import "UIView+CICSeparatorLine.h"
#import "UIImage+CICLibrary.h"
#import "NSString+CICBaseProperty.h"
#import "NSString+CICNetwork.h"
#import <SDWebImage/SDWebImage.h>
#import "UIImage+CICSize.h"

static NSUInteger const kEmptyNumber = 10;
static NSUInteger const kDeleteNumber = 12;

/// 数字键盘 按钮个数
static NSUInteger const kNumberKeyboardMaxNumber = 12;
/// 数字键盘 显示数字 个数0-9
static NSUInteger const kMaxNumber = 10;

static NSUInteger const kKeyboardButtonTagMargin = 360;
/// 每行键盘个数 3个
static NSUInteger const kPerLineNumber = 3;
/// 键盘 4行
static NSUInteger const kLineNumber = 4;

@interface CICNumberKeyboardView ()

@property (nonatomic, copy) NSArray *numberArray;
/// 数字是否是随机排列
@property (nonatomic, assign) BOOL isRandom;
/// 键盘数字
@property (nonatomic, strong) NSMutableArray *numberData;
@property (nonatomic, assign) CICKeyboardType keyboardType;
@property (nonatomic, assign) UIColor *titleColor;
@property (nonatomic, assign) UIColor *titleHighlightColor;
@property (nonatomic, assign) UIColor *lineColor;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) UIFont *titleFont;
@property (nonatomic, assign) UIColor *numberButtonBackgroundColor;
@property (nonatomic, assign) UIColor *otherButtonBackgroundColor;
@property (nonatomic, assign) CGSize deleteIconSize;
/// 键盘删除图标 本地图片名称或者图片链接
@property (nonatomic, copy) NSString *deleteIconNormalImageSource;
@property (nonatomic, copy) NSString *deleteIconHighlightImageSource;
/// 动态变化键盘数字顺序
@property (nonatomic, assign) BOOL changeRandomNumber;

@end

@implementation CICNumberKeyboardView

+ (CICNumberKeyboardView *)cic_keyboardViewWithType:(CICKeyboardType)keyboardType {
    
    return [CICNumberKeyboardView cic_keyboardViewWithType:keyboardType keyboardHeight:200];
}

+ (CICNumberKeyboardView *)cic_keyboardViewWithType:(CICKeyboardType)keyboardType keyboardHeight:(CGFloat)keyboardHeight {
    
    CICNumberKeyboardView *keyboardView = [[CICNumberKeyboardView alloc] init];
    keyboardView.cic
    .frame(CGRectMake(0, CIC_SCREEN_HEIGHT, CIC_SCREEN_WIDTH, keyboardHeight))
    .keyboardType(CICKeyboardTypeRandomNumber);
    return keyboardView;
}

#pragma mark - Life Cycle
- (instancetype)init {
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.isRandom = NO;
        self.numberArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0",nil];
        
        self.frame = CGRectMake(0, CIC_SCREEN_HEIGHT, CIC_SCREEN_WIDTH, 200);
        self.keyboardType = CICKeyboardTypeRandomNumber;
        self.titleHighlightColor = self.titleColor = [UIColor blackColor];
        self.deleteIconSize = CGSizeZero;
        _fontSize = 20;
        _lineColor = CIC_COLOR_SEPARATOR_LINE;
        _numberButtonBackgroundColor = [UIColor whiteColor];
        _otherButtonBackgroundColor = CIC_COLOR_E2E2E2;
    }
    return self;
}

#pragma mark - Build View
- (void)buildNumberView {
    
    for (NSUInteger i = 0; i < kNumberKeyboardMaxNumber; i++) {
        UIButton *button = [self buildKeyboardButtonAtIndex:i];
        [self addSubview:button];
    }
}

#pragma mark - Actions
- (void)clickKeyboardButton:(UIButton *)button {
    
    NSInteger index = button.tag - kKeyboardButtonTagMargin;
    if ([[self.numberData objectAtIndex:index] integerValue] == kEmptyNumber) {
        return;
    }
    
    if (self.clickKeyboardButtonBlock) {
        NSString *title = button.titleLabel.text;
        self.clickKeyboardButtonBlock(title);
    }
}

#pragma mark - Setter Methods
- (void)setKeyboardType:(CICKeyboardType)keyboardType {
    
    _keyboardType = keyboardType;
    [self initNumberDataWithKeyboardType:keyboardType];
}

- (void)setTitleColor:(UIColor *)titleColor {
    
    _titleColor = titleColor;
    
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                [tempButton setTitleColor:titleColor forState:UIControlStateNormal];
            }
        }
    }
}

- (void)setTitleHighlightColor:(UIColor *)titleHighlightColor {
    
    _titleHighlightColor = titleHighlightColor;
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                [tempButton setTitleColor:titleHighlightColor forState:UIControlStateHighlighted];
            }
        }
    }
}

- (void)setFontSize:(CGFloat)fontSize {
    
    _fontSize = fontSize;
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                tempButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
            }
        }
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    
    _titleFont = titleFont;
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                tempButton.titleLabel.font = titleFont;
            }
        }
    }
}

- (void)setNumberButtonBackgroundColor:(UIColor *)numberButtonBackgroundColor {
    
    _numberButtonBackgroundColor = numberButtonBackgroundColor;
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                if (![NSString cic_isEmpty:tempButton.titleLabel.text]) {
                    tempButton.backgroundColor = numberButtonBackgroundColor;
                }
            }
        }
    }
}

- (void)setOtherButtonBackgroundColor:(UIColor *)otherButtonBackgroundColor {
    
    _otherButtonBackgroundColor = otherButtonBackgroundColor;
    if ([self viewWithTag:kKeyboardButtonTagMargin]) {
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *tempButton = (UIButton *)subView;
                if ([NSString cic_isEmpty:tempButton.titleLabel.text]) {
                    tempButton.backgroundColor = otherButtonBackgroundColor;
                }
            }
        }
    }
}

- (void)setDeleteIconNormalImageSource:(NSString *)deleteIconNormalImageSource {
    
    _deleteIconNormalImageSource = deleteIconNormalImageSource;
    UIButton *deleteButton = [self viewWithTag:kKeyboardButtonTagMargin + kDeleteNumber - 1];
    [self updateImageForDeleteButton:deleteButton];
}

- (void)setDeleteIconHighlightImageSource:(NSString *)deleteIconHighlightImageSource {
    
    _deleteIconHighlightImageSource = deleteIconHighlightImageSource;
    UIButton *deleteButton = [self viewWithTag:kKeyboardButtonTagMargin + kDeleteNumber - 1];
    [self updateButton:deleteButton imageWithUrl:deleteIconHighlightImageSource forState:UIControlStateHighlighted];
}

- (void)setChangeRandomNumber:(BOOL)changeRandomNumber {
    
    _changeRandomNumber = changeRandomNumber;
    
    if (changeRandomNumber && self.keyboardType == CICKeyboardTypeRandomNumber && [self viewWithTag:kKeyboardButtonTagMargin]) {
        [self initNumberDataWithKeyboardType:CICKeyboardTypeRandomNumber];
        for (NSUInteger index = 0; index < kNumberKeyboardMaxNumber - 1; index++) {
            if (index + 1 == kEmptyNumber || index + 1 == kDeleteNumber) {
                continue;
            }
            
            UIButton *tempButton = [self viewWithTag:index + kKeyboardButtonTagMargin];
            [tempButton setTitle:self.numberData[index] forState:UIControlStateNormal];
            [tempButton setTitle:self.numberData[index] forState:UIControlStateHighlighted];
        }
    }
}

#pragma mark - Private Methods
/// 初始化数字键盘数组
- (void)initNumberDataWithKeyboardType:(CICKeyboardType)type {
    
    self.numberData = [NSMutableArray array];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.numberArray];
    if (type == CICKeyboardTypeRandomNumber) {
        //  生成0-9不重复随机数组
        while (tempArray.count > 1) {
            NSUInteger randomIndex = arc4random() % tempArray.count;
            NSString *randomObject = [tempArray objectAtIndex:randomIndex];
            [self.numberData addObject:randomObject];
            [tempArray removeObject:randomObject];
        }
    }else {
        [self.numberData addObjectsFromArray:[self.numberArray subarrayWithRange:NSMakeRange(0, kMaxNumber - 1)]];
    }
    
    [self.numberData addObject:[NSString stringWithFormat:@"%ld", kEmptyNumber]];
    [self.numberData addObject:tempArray.lastObject];
    [self.numberData addObject:[NSString stringWithFormat:@"%ld", kDeleteNumber]];
}

- (UIButton *)buildKeyboardButtonAtIndex:(NSUInteger)index {
    
    CGFloat perKeyboardWidth = CIC_SCREEN_WIDTH / kPerLineNumber;
    CGFloat perKeyboardHeight = CGRectGetHeight(self.frame)/kLineNumber;
    
    CGFloat xMargin = (index % kPerLineNumber) * perKeyboardWidth;
    CGFloat yMargin = (index / kPerLineNumber) * perKeyboardHeight;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(xMargin, yMargin, perKeyboardWidth, perKeyboardHeight)];
    button.tag = kKeyboardButtonTagMargin + index;
    
    NSString *title = [self.numberData objectAtIndex:index];
    if ([self.numberArray containsObject:title]) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        [button setTitleColor:self.titleHighlightColor forState:UIControlStateHighlighted];
        button.titleLabel.font = self.titleFont ? self.titleFont : [UIFont systemFontOfSize:self.fontSize];
    }else if ([title integerValue] == kDeleteNumber) {
        if ([NSString cic_isEmpty:self.deleteIconNormalImageSource]) {
            UIImage * image = [UIImage cic_localBundleImageNamed:@"keyboard_delete_icon"];;
            if (!CGSizeEqualToSize(self.deleteIconSize, CGSizeZero)) {
                image = [image cic_imageScaleToSize:self.deleteIconSize];
            }
            [button setImage:image forState:UIControlStateNormal];
            [button setImage:image forState:UIControlStateHighlighted];
        }else {
            [self updateImageForDeleteButton:button];
        }
    }
    button.backgroundColor = [self.numberArray containsObject:title] ? self.numberButtonBackgroundColor : self.otherButtonBackgroundColor;
    [button addTarget:self action:@selector(clickKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (index % kPerLineNumber != 0) {
        button.cic.addLineViewWithColor(CICSeparatorLinePositionLeft, _lineColor);
    }
    if (index / kPerLineNumber != 0) {
        button.cic.addLineViewWithColor(CICSeparatorLinePositionTop, _lineColor);
    }
    
    return button;
}

- (void)updateImageForDeleteButton:(UIButton *)button {
    
    if (![NSString cic_isEmpty:self.deleteIconNormalImageSource]) {
        [self updateButton:button imageWithUrl:self.deleteIconNormalImageSource forState:UIControlStateNormal];
        NSString *url = ![NSString cic_isEmpty:self.deleteIconHighlightImageSource] ? self.deleteIconHighlightImageSource : self.deleteIconNormalImageSource;
        [self updateButton:button imageWithUrl:url forState:UIControlStateHighlighted];
    }
}

- (void)updateButton:(UIButton *)button imageWithUrl:(NSString *)url forState:(UIControlState)state {
    
    if ([url cic_isUrl]) {
        __weak typeof(self) weakSelf = self;
        [button sd_setImageWithURL:[NSURL URLWithString:url] forState:state completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                if (!CGSizeEqualToSize(weakSelf.deleteIconSize, CGSizeZero)) {
                    image = [image cic_imageScaleToSize:weakSelf.deleteIconSize];
                }
                [button setImage:image forState:state];
            }
        }];
    }else {
        UIImage *image = [UIImage imageNamed:self.deleteIconHighlightImageSource];
        if (!CGSizeEqualToSize(self.deleteIconSize, CGSizeZero)) {
            image = [image cic_imageScaleToSize:self.deleteIconSize];
        }
        [button setImage:image forState:state];
    }
}

@end

@interface CICNumberKeyboardViewConstructor ()

@property (nonatomic, weak) CICNumberKeyboardView *component;

@end

@implementation CICNumberKeyboardViewConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(self) weakSelf = self;
    self.titleColor = ^CICNumberKeyboardViewConstructor * _Nonnull(UIColor * _Nonnull titleColor) {
        weakSelf.component.titleColor = titleColor;
        return weakSelf;
    };
    
    self.keyboardType = ^CICNumberKeyboardViewConstructor * _Nonnull(CICKeyboardType keyboardType) {
        weakSelf.component.keyboardType = keyboardType;
        return weakSelf;
    };
    
    self.titleHighlightColor = ^CICNumberKeyboardViewConstructor * _Nonnull(UIColor * _Nonnull titleHighlightColor) {
        weakSelf.component.titleHighlightColor = titleHighlightColor;
        return weakSelf;
    };
    
    self.fontSize = ^CICNumberKeyboardViewConstructor * _Nonnull(CGFloat fontSize) {
        weakSelf.component.fontSize = fontSize;
        return weakSelf;
    };
    
    self.titleFont = ^CICNumberKeyboardViewConstructor * _Nonnull(UIFont * _Nonnull titleFont) {
        weakSelf.component.titleFont = titleFont;
        return weakSelf;
    };
    
    self.numberButtonBackgroundColor = ^CICNumberKeyboardViewConstructor * _Nonnull(UIColor * _Nonnull numberButtonBackgroundColor) {
        weakSelf.component.numberButtonBackgroundColor = numberButtonBackgroundColor;
        return weakSelf;
    };
    
    self.otherButtonBackgroundColor = ^CICNumberKeyboardViewConstructor * _Nonnull(UIColor * _Nonnull otherButtonBackgroundColor) {
        weakSelf.component.otherButtonBackgroundColor = otherButtonBackgroundColor;
        return weakSelf;
    };
    
    self.deleteIconSize = ^CICNumberKeyboardViewConstructor * _Nonnull(CGSize size) {
        weakSelf.component.deleteIconSize = size;
        return weakSelf;
    };
    
    self.deleteIconNormalImageSource = ^CICNumberKeyboardViewConstructor * _Nonnull(NSString * _Nonnull deleteIconNormalImageSource) {
        weakSelf.component.deleteIconNormalImageSource = deleteIconNormalImageSource;
        return weakSelf;
    };
    
    self.deleteIconHighlightImageSource = ^CICNumberKeyboardViewConstructor * _Nonnull(NSString * _Nonnull deleteIconHighlightImageSource) {
        weakSelf.component.deleteIconHighlightImageSource = deleteIconHighlightImageSource;
        return weakSelf;
    };
    
    self.lineColor = ^CICNumberKeyboardViewConstructor * _Nonnull(UIColor * _Nonnull lineColor) {
        weakSelf.component.lineColor = lineColor;
        return weakSelf;
    };
    
    self.changeRandomNumber = ^CICNumberKeyboardViewConstructor * _Nonnull(BOOL changeRandomNumber) {
        weakSelf.component.changeRandomNumber = changeRandomNumber;
        return weakSelf;
    };
    
    self.addTo = ^CICUIViewConstructor *(UIView *toView) {
        [weakSelf.component buildNumberView];
        [toView addSubview:weakSelf.component];
        return weakSelf;
    };
}

@end

@implementation CICNumberKeyboardView (CICConstructor)

- (CICNumberKeyboardViewConstructor *)cic {
    
    return [[CICNumberKeyboardViewConstructor alloc] initWithComponent:self];
}

@end
