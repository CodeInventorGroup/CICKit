//
//  CICTabBarItem.h
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICTabBarItem : NSObject

/// 每个Item对应根视图控制器的类名
@property (nonatomic, copy) NSString *controllerClassName;
/// 是否显示文字(默认显示)
@property (nonatomic, assign) BOOL isShowTitle;
@property (nonatomic, copy) NSString *title;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id normalImage;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id selectedImage;

/// 显示文字
+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title normalImage:(id)normalImage controllerClassName:(NSString *)controllerClassName;
+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title normalImage:(id)normalImage selectedImage:(id)selectedImage controllerClassName:(NSString *)controllerClassName;

/// 不显示文字
+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage controllerClassName:(NSString *)controllerClassName;
+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage selectedImage:(id)selectedImage controllerClassName:(NSString *)controllerClassName;

@end

@interface CICTabBarItemConstructor<CICTabBarItem> : CICConstructor

CICConstructorProperty(CICTabBarItemConstructor, controllerClassName, NSString *controllerClassName)
CICConstructorProperty(CICTabBarItemConstructor, title, NSString *title)
CICConstructorProperty(CICTabBarItemConstructor, normalImage, id normalImage)
CICConstructorProperty(CICTabBarItemConstructor, selectedImage, id selectedImage)
CICConstructorProperty(CICTabBarItemConstructor, isShowTitle, BOOL isShowTitle)

@end

@interface CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
