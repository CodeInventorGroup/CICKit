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

@property (nonatomic, copy) NSString *title;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id normalImage;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id selectedImage;

@end

@interface CICTabBarItemConstructor<CICTabBarItem> : CICConstructor

CICConstructorProperty(CICTabBarItemConstructor, title, NSString *title)
CICConstructorProperty(CICTabBarItemConstructor, normalImage, id normalImage)
CICConstructorProperty(CICTabBarItemConstructor, selectedImage, id selectedImage)

@end

@interface CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
