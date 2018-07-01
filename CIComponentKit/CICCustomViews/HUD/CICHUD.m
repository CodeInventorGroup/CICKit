//
//  CICHUD.m
//  CIComponentKit
//
//  Created by ManoBoo on 2017/10/16.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICHUD.h"

#import "CICSizeMacros.h"
#import "CICLabel.h"

@interface CICHUD()

@property (nonatomic, strong) UIVisualEffectView *contentView;

@property (nonatomic, strong) CICLabel *titleLabel;

@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation CICHUD

- (CICHUDConstructor *)cic {
    return [[CICHUDConstructor alloc] initWithComponent:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initProperties];
    }
    return self;
}

- (void)initProperties {
    _loadingSize = CGSizeMake(CIC_SCREEN_WIDTH - 100, 120);
    _toastSize = CGSizeMake(CIC_SCREEN_WIDTH - 180, 60);
    _contentInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    _isAutoResize = FALSE;
    _style = CICHUDStyleToast;
    _blurStyle = UIBlurEffectStyleExtraLight;
    self.cic.size(_loadingSize);
    
    _contentView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:_blurStyle]];
    [self addSubview:_contentView];
    
    _titleLabel = [CICLabel new];
    _titleLabel.cic.textColor([UILabel appearance].textColor).font([UIFont systemFontOfSize:14.0]);
    [_contentView.contentView addSubview:_titleLabel];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)];
    [_contentView.contentView addSubview:_activityView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _contentView.cic.frame(self.bounds);
}

//TODO: .....TODO.....
- (void)render {
    _contentView.effect = [UIBlurEffect effectWithStyle:_blurStyle];
    _activityView.hidden = (_style == CICHUDStyleToast);
    _titleLabel.attributedText = _title;
    if (_style == CICHUDStyleToast) {
        [_titleLabel sizeToFit];
        _titleLabel.cic.center(self.center);
    }
    
}

//MARK: Functions

static CICHUD *instancae;
+(instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instancae = [[self alloc] initWithFrame:CGRectZero];
        [instancae render];
    });
    return instancae;
}

- (void)toasWithTitle:(NSAttributedString *)title {
    _title = title;
    [self render];
    if (![self superview]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.cic.center(keyWindow.center);
        [keyWindow addSubview:self];
    }
}

- (instancetype)initWithTitle:(NSAttributedString *)title HUDStyle:(CICHUDStyle)style LayoutStyle:(CICHUDLayoutStyle)layoutStyle BlurEffectStyle:(UIBlurEffectStyle)blurStyle {
    [self initProperties];
    self.title = title;
    self.style = style;
    self.layoutStyle = layoutStyle;
    self.blurStyle = blurStyle;
    return self;
}

- (instancetype)initWithTitle:(NSAttributedString *)title LayoutStyle:(CICHUDLayoutStyle)layoutStyle {
    return [self initWithTitle:title HUDStyle:CICHUDStyleLoading LayoutStyle:layoutStyle BlurEffectStyle:UIBlurEffectStyleExtraLight];
}

- (instancetype)initWithTitle:(NSAttributedString *)title {
    return [self initWithTitle:title LayoutStyle:CICHUDLayoutStyleLeft];
}
@end


//MARK: Extension

@interface CICHUDConstructor ()

@property (nonatomic, weak) CICHUD *component;

@end

@implementation CICHUDConstructor

CICConstructorBasicDynamics()

- (void)buildConstructor {
    [super buildConstructor];
}
@end

