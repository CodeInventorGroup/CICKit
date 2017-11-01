//
//  CICHUD.h
//  CIComponentKit
//
//  Created by ManoBoo on 2017/10/16.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+CICConstructor.h"

//MARK: Enum

/// 提供两种样式， loading & toast
typedef enum : NSUInteger {
    CICHUDStyleLoading,
    CICHUDStyleToast,
} CICHUDStyle;

/// 图片的位置
typedef enum : NSUInteger {
    CICHUDLayoutStyleLeft,  // 图片在左
    CICHUDLayoutStyleTop,
    CICHUDLayoutStyleRight,
    CICHUDLayoutStyleBottom
} CICHUDLayoutStyle;


//MARK: View

@class CICHUDConstructor;
@interface CICHUD : UIView

/// loading风格的 Size，默认为 {ScreenWidth - 100, 120}
@property (nonatomic, assign) CGSize loadingSize;

/// toast风格的 Size，默认为 {ScreenWidth - 180, 60}
@property (nonatomic, assign) CGSize toastSize;

/// 内容的边距，默认为 {20,20,20,20}
@property (nonatomic, assign) UIEdgeInsets contentInsets;

/// 是否自适应大小，默认为 FALSE
@property (nonatomic, assign) BOOL isAutoResize;

/// CICHUD的样式， 默认为Loading
@property (nonatomic, assign) CICHUDStyle style;

///
@property (nonatomic, assign) CICHUDLayoutStyle layoutStyle;

/// 模糊效果，默认为 extraLight
@property (nonatomic, assign) UIBlurEffectStyle blurStyle;

/// 提示文字
@property (nonatomic, strong) NSAttributedString *title;

+ (instancetype)share;

- (void)toasWithTitle:(NSAttributedString *)title;

- (instancetype)initWithTitle:(NSAttributedString *)title;

- (instancetype)initWithTitle:(NSAttributedString *)title LayoutStyle:(CICHUDLayoutStyle)layoutStyle;

- (instancetype)initWithTitle:(NSAttributedString *)title
                     HUDStyle:(CICHUDStyle)style
                  LayoutStyle:(CICHUDLayoutStyle)layoutStyle
              BlurEffectStyle:(UIBlurEffectStyle)blurStyle;

- (CICHUDConstructor *)cic;
@end



//MARK: Extension

@interface CICHUDConstructor<CICHUD> : CICUIViewConstructor

CICConstructorBasicProperties(CICHUDConstructor)


@end
