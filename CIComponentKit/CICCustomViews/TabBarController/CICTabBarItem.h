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

CICConstructorProperty(CICTabBarItemConstructor, controllerClassName, NSString *controllerClassName)
CICConstructorProperty(CICTabBarItemConstructor, title, NSString *title)
CICConstructorProperty(CICTabBarItemConstructor, normalImage, id normalImage)
CICConstructorProperty(CICTabBarItemConstructor, selectedImage, id selectedImage)
CICConstructorProperty(CICTabBarItemConstructor, isShowTitle, BOOL isShowTitle)
CICConstructorProperty(CICTabBarItemConstructor, normalImageSize, CGSize size)
CICConstructorProperty(CICTabBarItemConstructor, selectedImageSize, CGSize size)

@end

@interface CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
