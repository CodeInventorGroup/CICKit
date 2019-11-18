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

@property (nonatomic, readonly, copy) NSString *title;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, readonly, strong) id normalImage;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, readonly, strong) id selectedImage;

/// 是否显示标题(默认显示)
@property (nonatomic, readonly, assign) BOOL isShowTitle;
/// 选中状态 是否显示标题(默认显示)
@property (nonatomic, readonly, assign) BOOL isShowTitleWhenSelected;

@property (nonatomic, readonly, assign) CGSize normalImageSize;
@property (nonatomic, readonly, assign) CGSize selectedImageSize;

@end

@interface CICBarItemConstructor<CICBarItem> : CICConstructor

CICConstructorProperty(CICBarItemConstructor, title, NSString *title)
CICConstructorProperty(CICBarItemConstructor, normalImage, id normalImage)
CICConstructorProperty(CICBarItemConstructor, selectedImage, id selectedImage)

CICConstructorProperty(CICBarItemConstructor, isShowTitle, BOOL isShowTitle)
CICConstructorProperty(CICBarItemConstructor, isShowTitleWhenSelected, BOOL isShow)
CICConstructorProperty(CICBarItemConstructor, normalImageSize, CGSize size)
CICConstructorProperty(CICBarItemConstructor, selectedImageSize, CGSize size)

@end

@interface CICBarItem (CICConstructor)

- (CICBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
