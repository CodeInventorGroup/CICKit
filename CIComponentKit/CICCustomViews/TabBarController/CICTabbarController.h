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

@property (nonatomic, readonly, copy) NSString *barBackgroundImage;
@property (nonatomic, readonly, strong) UIColor *selectedTitleColr;
@property (nonatomic, readonly, strong) UIColor *normalTitleColr;

/// 是否显示文字(默认显示)
@property (nonatomic, readonly, assign) BOOL isShowTitle;
/// 所有Item的图片大小均一样
@property (nonatomic, readonly, assign) CGSize normalImageSize;
@property (nonatomic, readonly, assign) CGSize selectedImageSize;

/// 标题和图片之间的间距
@property (nonatomic, readonly, assign) CGFloat titleImageMiddleMargin;
@property (nonatomic, copy) void(^didSelectedTabbarBlock)(NSInteger selectedIndex);

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

CICConstructorProperty(CICTabbarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)
CICConstructorProperty(CICTabbarControllerConstructor, updateTabBarItemData, CICBarItem *item, NSInteger itemIndex)

CICConstructorProperty(CICTabbarControllerConstructor, isShowTitle, BOOL isShowTitle)
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
