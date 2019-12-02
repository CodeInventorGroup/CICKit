//
//  CICTabBarController.h
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

@interface CICTabBarController : UITabBarController

@property (nonatomic, readonly, copy) NSArray<CICTabBarItem *> *tabBarItemData;

@property (nonatomic, readonly, strong) UIColor *selectedTitleColor;
@property (nonatomic, readonly, strong) UIColor *normalTitleColor;
@property (nonatomic, readonly, assign) NSUInteger selectedItemIndex;
/// 标题和图片之间的间距
@property (nonatomic, readonly, assign) CGFloat titleImageMiddleMargin;
@property (nonatomic, readonly, strong) UIColor *barBackgroundColor;
@property (nonatomic, readonly, strong) id barBackgroundImage;

/// 未选中状态 图片统一大小(优先级最低)(不设置根据图片大小显示)
@property (nonatomic, readonly, assign) CGSize normalImageSize;
/// 选中状态 图片统一大小(优先级最低)(不设置根据图片大小显示)
@property (nonatomic, readonly, assign) CGSize selectedImageSize;

@end

@interface CICTabbarControllerConstructor<CICTabbarController> : CICUIViewConstructor

/// 初始化TabBarController调用
CICConstructorProperty(CICTabbarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)

CICConstructorProperty(CICTabbarControllerConstructor, normalTitleColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, selectedTitleColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundColor, UIColor *color)
CICConstructorProperty(CICTabbarControllerConstructor, barBackgroundImage, id backgroundImage)

CICConstructorProperty(CICTabbarControllerConstructor, selectedItemIndex, NSUInteger index)
CICConstructorProperty(CICTabbarControllerConstructor, titleImageMiddleMargin, CGFloat titleImageMiddleMargin)
CICConstructorProperty(CICTabbarControllerConstructor, normalImageSize, CGSize size)
CICConstructorProperty(CICTabbarControllerConstructor, selectedImageSize, CGSize size)

CICConstructorProperty(CICTabbarControllerConstructor, badgeValue, NSUInteger index, NSString *value)
/// 更新TabBarItem文字或图片数据
CICConstructorProperty(CICTabbarControllerConstructor, updateBarItemData, CICBarItem *item, NSInteger itemIndex)
CICConstructorProperty(CICTabbarControllerConstructor, updateAllBarItemData, NSArray<CICBarItem *> *barItemData)
CICConstructorProperty(CICTabbarControllerConstructor, didSelectViewControllerBlock, CICDidSelectViewControllerBlock selectBlock)

@end

@interface CICTabBarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
