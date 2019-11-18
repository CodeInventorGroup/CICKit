//
//  CICTabBarItem.h
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CICBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICTabBarItem : CICBarItem

/// 每个Item对应根视图控制器的类名
@property (nonatomic, readonly,copy) NSString *controllerClassName;

/// 显示文字
+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title
                               normalImage:(id)normalImage
                       controllerClassName:(NSString *)controllerClassName;

+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title
                               normalImage:(id)normalImage
                             selectedImage:(id)selectedImage
                       controllerClassName:(NSString *)controllerClassName;

/// 不显示文字
+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage
                                    controllerClassName:(NSString *)controllerClassName;

+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage
                                          selectedImage:(id)selectedImage
                                    controllerClassName:(NSString *)controllerClassName;

@end

@interface CICTabBarItemConstructor<CICTabBarItem> : CICBarItemConstructor

/// TabBarItem对应显示的controller的类名
CICConstructorProperty(CICTabBarItemConstructor, controllerClassName, NSString *controllerClassName)
// 标题
CICConstructorProperty(CICTabBarItemConstructor, title, NSString *title)
/// 未选中状态 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
CICConstructorProperty(CICTabBarItemConstructor, normalImage, id normalImage)
/// 选中状态 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
CICConstructorProperty(CICTabBarItemConstructor, selectedImage, id selectedImage)

/// 未选中状态 是否显示标题(默认显示)
CICConstructorProperty(CICTabBarItemConstructor, isShowTitle, BOOL isShowTitle)
/// 选中状态 是否显示标题(默认显示)
CICConstructorProperty(CICTabBarItemConstructor, isShowTitleWhenSelected, BOOL isShow)
/// 未选中状态 图片大小(优先级高于CICTabBarController设置的normalImageSize)
CICConstructorProperty(CICTabBarItemConstructor, normalImageSize, CGSize size)
/// 选中状态 图片大小(优先级高于CICTabBarController设置的selectedImageSize)
CICConstructorProperty(CICTabBarItemConstructor, selectedImageSize, CGSize size)

@end

@interface CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
