//
//  CICBarItem.h
//  CICKit
//
//  Created by NEWWORLD on 2019/11/18.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICBarItem : NSObject

/// 标题
@property (nonatomic, readonly, copy) NSString *title;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, readonly, strong) id normalImage;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, readonly, strong) id selectedImage;

/// 未选中状态 是否显示标题(默认显示)
@property (nonatomic, readonly, assign) BOOL isShowTitle;
/// 选中状态 是否显示标题(默认显示)
@property (nonatomic, readonly, assign) BOOL isShowTitleWhenSelected;

/// 未选中状态 图片大小(不设置根据图片大小显示)
@property (nonatomic, readonly, assign) CGSize normalImageSize;
/// 选中状态 图片大小(不设置根据图片大小显示)
@property (nonatomic, readonly, assign) CGSize selectedImageSize;

@end

@interface CICBarItemConstructor<CICBarItem> : CICConstructor

/// 标题
@property (nonatomic, readonly, copy) CICBarItemConstructor *(^title)(NSString *title);
/// 标题
//CICConstructorProperty(CICBarItemConstructor, title, NSString *title)
/// 未选中状态 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
CICConstructorProperty(CICBarItemConstructor, normalImage, id normalImage)
/// 选中状态 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
CICConstructorProperty(CICBarItemConstructor, selectedImage, id selectedImage)

/// 未选中状态 是否显示标题(默认显示)
CICConstructorProperty(CICBarItemConstructor, isShowTitle, BOOL isShowTitle)
/// 选中状态 是否显示标题(默认显示)
CICConstructorProperty(CICBarItemConstructor, isShowTitleWhenSelected, BOOL isShow)
/// 未选中状态 图片大小
CICConstructorProperty(CICBarItemConstructor, normalImageSize, CGSize size)
/// 选中状态 图片大小
CICConstructorProperty(CICBarItemConstructor, selectedImageSize, CGSize size)

@end

@interface CICBarItem (CICConstructor)

- (CICBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
