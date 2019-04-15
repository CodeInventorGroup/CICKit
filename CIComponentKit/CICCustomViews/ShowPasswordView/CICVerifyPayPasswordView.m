//
//  CICVerifyPayPasswordView.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  自定义 输入6位密码显示框
//

#import "CICVerifyPayPasswordView.h"

#import "NSString+CICBaseProperty.h"
#import "UIView+CICSeparatorLine.h"
#import "UIImageView+CICConstructor.h"
#import "UIImage+CICLibrary.h"

/// 密码位数
static NSUInteger const kPasswordNumber = 6;
/// 显示密码的View tag
static NSUInteger const kDotViewTagMargin = 280;

static NSTimeInterval const kTimeDuration = 0.3;

@interface CICVerifyPayPasswordView ()

@property (nonatomic, copy) void(^verifyPayPasswordBlock)(NSString *);
/// 密码输入框
@property (nonatomic, strong) UIView *passwordInputView;
/// 当前已输入密码最后一位位置
@property (nonatomic, assign) NSInteger inputIndex;

@property (nonatomic, strong) CICNumberKeyboardView *keyboardView;
/// 密码
@property (nonatomic, copy) NSString *password;

@property (nonatomic, assign) CGFloat keyboardBottomHeight;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, assign) CICKeyboardType keyboardType;

@end

@implementation CICVerifyPayPasswordView

#pragma mark - Class Methods
+ (CICVerifyPayPasswordView *)verifyPayPasswordViewWithFrame:(CGRect)frame
                                      verifyPayPasswordBlock:(void(^)(NSString *))verifyPayPasswordBlock {
    
    return [self verifyPayPasswordViewWithFrame:frame showKeyboardBottomHeight:0 keyboardHeight:0 keyboardType:CICKeyboardTypeRandomNumber verifyPayPasswordBlock:verifyPayPasswordBlock];
}

+ (CICVerifyPayPasswordView *)verifyPayPasswordViewWithFrame:(CGRect)frame
                                                keyboardType:(CICKeyboardType)keyboardType
                                      verifyPayPasswordBlock:(void(^)(NSString *))verifyPayPasswordBlock {
    
    return [self verifyPayPasswordViewWithFrame:frame showKeyboardBottomHeight:0 keyboardHeight:0 keyboardType:keyboardType verifyPayPasswordBlock:verifyPayPasswordBlock];
}

+ (CICVerifyPayPasswordView *)verifyPayPasswordViewWithFrame:(CGRect)frame
                                    showKeyboardBottomHeight:(CGFloat)bottomHeight
                                              keyboardHeight:(CGFloat)keyboardHeight
                                                keyboardType:(CICKeyboardType)keyboardType
                                      verifyPayPasswordBlock:(void(^)(NSString *))verifyPayPasswordBlock {
    
    CICVerifyPayPasswordView *verifyPayPasswordView = [[CICVerifyPayPasswordView alloc] initWithFrame:frame];
    verifyPayPasswordView.keyboardHeight = keyboardHeight;
    verifyPayPasswordView.keyboardBottomHeight = bottomHeight;
    verifyPayPasswordView.keyboardType = keyboardType;
    verifyPayPasswordView.verifyPayPasswordBlock = verifyPayPasswordBlock;
    [verifyPayPasswordView buildView];
    return verifyPayPasswordView;
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        //  当前 无任何输入值
        _inputIndex = -1;
        self.password = @"";
    }
    return self;
}

#pragma mark - Build View
- (void)buildView {
    
    [self addSubview:self.passwordInputView];
}

#pragma mark - Public Methods
- (void)cic_addTo:(UIView *)superview {
    
    [superview addSubview:self];
    [superview sendSubviewToBack:self];
    [superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOtherEmptyView)]];
}

#pragma mark - Actions
/// 点击 密码输入区域
- (void)tapInputPasswordView {
    
    self.keyboardView.cic.changeRandomNumber(YES);
    [UIView animateWithDuration:kTimeDuration animations:^{
        self.keyboardView.cic.y(CIC_SCREEN_HEIGHT - self.keyboardBottomHeight - CGRectGetHeight(self.keyboardView.frame) - CIC_BOTTOM_INDICATE_HEIGHT);
    }];
}

/// 点击 其他空白区域
- (void)tapOtherEmptyView {
    
    if (_keyboardView) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:kTimeDuration animations:^{
            weakSelf.keyboardView.cic.y(CIC_SCREEN_HEIGHT);
        }];
    }
}

#pragma mark - Private Methods
- (void)handleKeyboardInputValue:(NSString *)value {
    
    NSUInteger length = self.password.length;
    if (length == kPasswordNumber && ![NSString cic_isEmpty:value]) {
        return;
    }
    
    if ([NSString cic_isEmpty:value]) {
        if (length > 0) {
            self.password = [self.password substringToIndex:length - 1];
            if (self.password.length == 0) {
                self.password = @"";
            }
            [self handleLabelContentIsShow:NO];
            self.inputIndex--;
        }
    }else {
        self.password = [self.password stringByAppendingString:value];
        self.inputIndex++;
        [self handleLabelContentIsShow:YES];
        if (length + 1 == kPasswordNumber) {
            if (self.verifyPayPasswordBlock) {
                self.verifyPayPasswordBlock(self.password);
            }
        }
    }
}

- (void)handleLabelContentIsShow:(BOOL)isShow {
    
    UIView *dotView = [self.passwordInputView viewWithTag:self.inputIndex + kDotViewTagMargin];
    dotView.hidden = !isShow;
}

#pragma mark - Lazy Load
- (UIView *)passwordInputView {
    
    if (!_passwordInputView) {
        CGFloat width = CGRectGetWidth(self.frame);
        _passwordInputView = [[UIView alloc] initWithFrame:self.bounds];
        _passwordInputView.backgroundColor = [UIColor whiteColor];
        [_passwordInputView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInputPasswordView)]];
        _passwordInputView.layer.borderWidth = CIC_SEPARATOR_LINE_SIZE;
        _passwordInputView.layer.borderColor = CIC_COLOR_SEPARATOR_LINE.CGColor;
        
        CGFloat perLabelWidth = width / kPasswordNumber;
        for (NSUInteger i = 0; i < kPasswordNumber; i++) {
            CGFloat perDotWidth = 10;
            UIImageView *dotImageView = [[UIImageView alloc] init];
            dotImageView.cic.frame(CGRectMake(i * perLabelWidth + (perLabelWidth - perDotWidth)/2.0, (CGRectGetHeight(_passwordInputView.frame) - perDotWidth)/2.0, perDotWidth, perDotWidth))
            .tag(i + kDotViewTagMargin)
            .hidden(YES)
            .userInteractionEnabled(YES)
            .addTo(_passwordInputView);
            dotImageView.image = [UIImage cic_localBundleImageNamed:@"dot_icon"];
            if (i > 0) {
                [_passwordInputView addSubview:[UIView cic_separatorLineWithFrame:CGRectMake(i * perLabelWidth, 0, CIC_SEPARATOR_LINE_SIZE, CGRectGetHeight(_passwordInputView.frame))]];
            }
        }
    }
    return _passwordInputView;
}

- (CICNumberKeyboardView *)keyboardView {
    
    if (!_keyboardView) {
        _keyboardView = [[CICNumberKeyboardView alloc] init];
        _keyboardView.cic
        .lineColor(CIC_COLOR_SEPARATOR_LINE)
        .keyboardType(CICKeyboardTypeRandomNumber)
        .titleColor([UIColor blackColor])
        .titleHighlightColor([UIColor redColor])
        .fontSize(20)
        .numberButtonBackgroundColor([UIColor whiteColor])
        .otherButtonBackgroundColor(CIC_COLOR_E2E2E2)
        .addTo(self.superview);
        
        if (self.keyboardHeight > 0) {
            _keyboardView.cic.height(self.keyboardHeight);
        }
        [self.superview bringSubviewToFront:_keyboardView];
        
        __weak  typeof(self) weakSelf = self;
        _keyboardView.clickKeyboardButtonBlock = ^(NSString * _Nonnull value) {
            [weakSelf handleKeyboardInputValue:value];
        };
    }
    return _keyboardView;
}

@end
