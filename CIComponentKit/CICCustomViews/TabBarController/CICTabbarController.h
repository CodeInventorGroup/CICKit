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

typedef void(^CICDidSelectViewControllerBlock)(NSInteger index);

@interface CICTabbarController : UITabBarController

@property (nonatomic, readonly, copy) NSArray<CICTabBarItem *> *tabBarItemData;

@property (nonatomic, readonly, copy) NSString *barBackgroundImage;
@property (nonatomic, readonly, strong) UIColor *selectedTitleColr;
@property (nonatomic, readonly, strong) UIColor *normalTitleColr;

/// 所有Item的图片大小均一样
@property (nonatomic, readonly, assign) CGSize normalImageSize;
@property (nonatomic, readonly, assign) CGSize selectedImageSize;
@property (nonatomic, readonly, assign) NSUInteger selectedItemIndex;

/// 标题和图片之间的间距
@property (nonatomic, readonly, assign) CGFloat titleImageMiddleMargin;

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

/// 初始化TabBarController调用
CICConstructorProperty(CICTabbarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)

/// 更新TabBarItem文字或图片数据
CICConstructorProperty(CICTabbarControllerConstructor, updateBarItemData, CICBarItem *item, NSInteger itemIndex)
CICConstructorProperty(CICTabbarControllerConstructor, updateAllBarItemData, NSArray<CICBarItem *> *barItemData)
CICConstructorProperty(CICTabbarControllerConstructor, selectedTextColor, UIColor *selectedColor)
CICConstructorProperty(CICTabbarControllerConstructor, normalTextColor, UIColor *normalColor)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundImage, NSString *backgroundImage)
CICConstructorProperty(CICTabbarControllerConstructor, badgeValue, NSUInteger index, NSString *value)
CICConstructorProperty(CICTabbarControllerConstructor, selectedItemIndex, NSUInteger index)
CICConstructorProperty(CICTabbarControllerConstructor, titleImageMiddleMargin, CGFloat titleImageMiddleMargin)
CICConstructorProperty(CICTabbarControllerConstructor, didSelectViewControllerBlock, CICDidSelectViewControllerBlock selectBlock)

CICConstructorProperty(CICTabbarControllerConstructor, normalImageSize, CGSize imageSize)
CICConstructorProperty(CICTabbarControllerConstructor, selectedImageSize, CGSize imageSize)

@end

@interface CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
