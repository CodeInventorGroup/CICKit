//
//  CICTabbarController.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//  封装TabbarController

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICTabbarController : UITabBarController

/// Controller 类名
@property (nonatomic, copy) NSArray *classNameData;
/// 包含image
@property (nonatomic, copy) NSArray *itemDataNoTitleSelectedImage;
/// 包含title、image、(selectedImage 为orignal模式渲染)
@property (nonatomic, copy) NSArray *itemDataNoSelectedImage;
/// 包含title、image、selectedImage
@property (nonatomic, copy) NSArray *itemData;
/// 包含image、selectedImage
@property (nonatomic, copy) NSArray *itemDataNoTitle;
/// 设置背景图片url或者图片名称
@property (nonatomic, copy) NSString *barBackgroundImage;

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

/// Controller 类名
CICConstructorProperty(CICTabbarControllerConstructor, classNameData, NSArray *classNameData)
/// 包含image
CICConstructorProperty(CICTabbarControllerConstructor, itemDataNoTitleSelectedImage, NSArray *itemDataNoTitleSelectedImage)
/// 包含title、image、(selectedImage 为orignal模式渲染)
CICConstructorProperty(CICTabbarControllerConstructor, itemDataNoSelectedImage, NSArray *itemDataNoSelectedImage)
/// 包含title、image、selectedImage
CICConstructorProperty(CICTabbarControllerConstructor, itemData, NSArray *itemData)
/// 包含image、selectedImage
CICConstructorProperty(CICTabbarControllerConstructor, itemDataNoTitle, NSArray *itemDataNoTitle)

CICConstructorProperty(CICTabbarControllerConstructor, selectedTextColor, UIColor *selectedColor)
CICConstructorProperty(CICTabbarControllerConstructor, normalTextColor, UIColor *normalColor)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundImage, NSString *backgroundImage)

@end

@interface CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
