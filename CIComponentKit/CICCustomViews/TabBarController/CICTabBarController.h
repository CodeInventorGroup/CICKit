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

@interface CICTabBarControllerConstructor<CICTabBarController> : CICUIViewConstructor

/// 初始化TabBarController调用
CICConstructorProperty(CICTabBarControllerConstructor, tabBarItemData, NSArray<CICTabBarItem *> *tabBarItemData)

CICConstructorProperty(CICTabBarControllerConstructor, normalTitleColor, UIColor *color)
CICConstructorProperty(CICTabBarControllerConstructor, selectedTitleColor, UIColor *color)
CICConstructorProperty(CICTabBarControllerConstructor, barBackgroundColor, UIColor *color)
CICConstructorProperty(CICTabBarControllerConstructor, barBackgroundImage, id backgroundImage)

CICConstructorProperty(CICTabBarControllerConstructor, selectedItemIndex, NSUInteger index)
CICConstructorProperty(CICTabBarControllerConstructor, titleImageMiddleMargin, CGFloat titleImageMiddleMargin)
CICConstructorProperty(CICTabBarControllerConstructor, normalImageSize, CGSize size)
CICConstructorProperty(CICTabBarControllerConstructor, selectedImageSize, CGSize size)

CICConstructorProperty(CICTabBarControllerConstructor, badgeValue, NSUInteger index, NSString *value)
/// 更新TabBarItem文字或图片数据
CICConstructorProperty(CICTabBarControllerConstructor, updateBarItemData, CICBarItem *item, NSInteger itemIndex)
CICConstructorProperty(CICTabBarControllerConstructor, updateAllBarItemData, NSArray<CICBarItem *> *barItemData)
CICConstructorProperty(CICTabBarControllerConstructor, didSelectViewControllerBlock, CICDidSelectViewControllerBlock selectBlock)

@end

@interface CICTabBarController (CICConstructor)

- (CICTabBarControllerConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
