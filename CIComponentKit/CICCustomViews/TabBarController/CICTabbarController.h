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

@property (nonatomic, copy) NSArray<CICTabBarItem *> *tabBarItemData;

@property (nonatomic, copy) NSArray *classNameData;
@property (nonatomic, copy) NSArray *itemDataNormalImage;
@property (nonatomic, copy) NSArray *itemDataTitleNormalImage;
@property (nonatomic, copy) NSArray *itemDataTitleNormalSelectedImage;
@property (nonatomic, copy) NSArray *itemDataNormalSelectedImage;

@property (nonatomic, copy) NSString *barBackgroundImage;
@property (nonatomic, strong) UIColor *selectedTitleColr;
@property (nonatomic, strong) UIColor *normalTitleColr;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, copy) void(^didSelectedTabbarBlock)(NSInteger selectedIndex);

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

CICConstructorProperty(CICTabbarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)

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
/// 如果设置大小，在设置图片之前设置大小
CICConstructorProperty(CICTabbarControllerConstructor, imageSize, CGSize imageSize)
CICConstructorProperty(CICTabbarControllerConstructor, badgeValue, NSUInteger index, NSString *value)
CICConstructorProperty(CICTabbarControllerConstructor, selectedIndex, NSUInteger selectedIndex)

@end

@interface CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
