//
//  CICTabbarController.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//  封装TabbarController

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"
#import "CICTabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICTabbarController : UITabBarController

@property (nonatomic, readonly, copy) NSArray<CICTabBarItem *> *tabBarItemData;

@property (nonatomic, readonly, copy) NSArray *classNameData;
@property (nonatomic, readonly, copy) NSArray *itemDataNormalImage;
@property (nonatomic, readonly, copy) NSArray *itemDataTitleNormalImage;
@property (nonatomic, readonly, copy) NSArray *itemDataTitleNormalSelectedImage;
@property (nonatomic, readonly, copy) NSArray *itemDataNormalSelectedImage;

@property (nonatomic, readonly, copy) NSString *barBackgroundImage;
@property (nonatomic, readonly, strong) UIColor *selectedTitleColr;
@property (nonatomic, readonly, strong) UIColor *normalTitleColr;

/// 所有Item的图片大小均一样
@property (nonatomic, readonly, assign) CGSize normalImageSize;
@property (nonatomic, readonly, assign) CGSize selectedImageSize;

/// 标题和图片之间的间距
@property (nonatomic, readonly, assign) CGFloat titleImageMiddleMargin;
@property (nonatomic, copy) void(^didSelectedTabbarBlock)(NSInteger selectedIndex);

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

CICConstructorProperty(CICTabbarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)
CICConstructorProperty(CICTabbarControllerConstructor, updateTabBarItemData, CICTabBarItem *item, NSInteger itemIndex)

/// Controller 类名
CICConstructorProperty(CICTabbarControllerConstructor, classNameData, NSArray *classNameData)
/// 包含image(image可以用图片名或者url链接)(不修改title内容)
CICConstructorProperty(CICTabbarControllerConstructor, itemDataNormalImage, NSArray *itemDataNormalImage)
/// 包含title、image、(selectedImage 为orignal模式渲染)(不显示title时，title传@"")
CICConstructorProperty(CICTabbarControllerConstructor, itemDataTitleNormalImage, NSArray *itemDataTitleNormalImage)
/// 包含title、image、selectedImage(不显示title时，title传@"")
CICConstructorProperty(CICTabbarControllerConstructor, itemDataTitleNormalSelectedImage, NSArray *itemDataTitleNormalSelectedImage)
/// 包含image、selectedImage(Tabbar不修改title内容)
CICConstructorProperty(CICTabbarControllerConstructor, itemDataNormalSelectedImage, NSArray *itemDataNormalSelectedImage)

CICConstructorProperty(CICTabbarControllerConstructor, selectedTextColor, UIColor *selectedColor)
CICConstructorProperty(CICTabbarControllerConstructor, normalTextColor, UIColor *normalColor)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundImage, NSString *backgroundImage)
CICConstructorProperty(CICTabbarControllerConstructor, badgeValue, NSUInteger index, NSString *value)
CICConstructorProperty(CICTabbarControllerConstructor, selectedIndex, NSUInteger selectedIndex)
CICConstructorProperty(CICTabbarControllerConstructor, titleImageMiddleMargin, CGFloat titleImageMiddleMargin)

/// 如果设置大小，在设置图片之前设置大小
CICConstructorProperty(CICTabbarControllerConstructor, normalImageSize, CGSize imageSize)
CICConstructorProperty(CICTabbarControllerConstructor, selectedImageSize, CGSize imageSize)

@end

@interface CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
