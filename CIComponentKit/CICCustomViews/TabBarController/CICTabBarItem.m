//
//  CICTabBarItem.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICTabBarItem.h"

@interface CICTabBarItem ()

/// 每个Item对应根视图控制器的类名
@property (nonatomic, copy) NSString *controllerClassName;
/// 是否显示文字(默认显示)
@property (nonatomic, assign) BOOL isShowTitle;
@property (nonatomic, copy) NSString *title;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id normalImage;
/// 图片类型：可为UIImage或者NSData类型，或者image_url、image_name
@property (nonatomic, strong) id selectedImage;

@property (nonatomic, assign) CGSize normalImageSize;
@property (nonatomic, assign) CGSize selectedImageSize;

@end

@implementation CICTabBarItem

- (instancetype)init {
    
    if (self = [super init]) {
        self.isShowTitle = YES;
    }
    return self;
}

+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage controllerClassName:(NSString *)controllerClassName {
    
    return [self cic_tabBarItemNoTitleWithNormalImage:normalImage selectedImage:@"" controllerClassName:controllerClassName];
}

+ (CICTabBarItem *)cic_tabBarItemNoTitleWithNormalImage:(id)normalImage selectedImage:(id)selectedImage controllerClassName:(NSString *)controllerClassName {
    
    return [self cic_tabBarItemWithTitle:@"" normalImage:normalImage selectedImage:selectedImage controllerClassName:controllerClassName isShowTitle:NO];
}


+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title normalImage:(id)normalImage controllerClassName:(NSString *)controllerClassName {
    
    return [self cic_tabBarItemWithTitle:title normalImage:normalImage selectedImage:@"" controllerClassName:controllerClassName];
}

+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title normalImage:(id)normalImage selectedImage:(id)selectedImage controllerClassName:(NSString *)controllerClassName {
    
    return [self cic_tabBarItemWithTitle:title normalImage:normalImage selectedImage:selectedImage controllerClassName:controllerClassName isShowTitle:YES];
}

+ (CICTabBarItem *)cic_tabBarItemWithTitle:(NSString *)title
                               normalImage:(id)normalImage
                             selectedImage:(id)selectedImage
                       controllerClassName:(NSString *)controllerClassName
                               isShowTitle:(BOOL)isShowTitle {
    
    CICTabBarItem *tabBarItem = [[CICTabBarItem alloc] init];
    tabBarItem.cic
    .title(title)
    .normalImage(normalImage)
    .selectedImage(selectedImage)
    .controllerClassName(controllerClassName)
    .isShowTitle(isShowTitle);
    return tabBarItem;
}

@end

@interface CICTabBarItemConstructor ()

@property (nonatomic, weak) CICTabBarItem *component;

@end

@implementation CICTabBarItemConstructor

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(self) weakSelf = self;
    self.controllerClassName = ^CICTabBarItemConstructor * _Nonnull(NSString * _Nonnull controllerClassName) {
        weakSelf.component.controllerClassName = controllerClassName;
        return weakSelf;
    };
    
    self.title = ^CICTabBarItemConstructor * _Nonnull(NSString * _Nonnull title) {
        weakSelf.component.title = title;
        return weakSelf;
    };
    
    self.normalImage = ^CICTabBarItemConstructor * _Nonnull(id  _Nonnull normalImage) {
        weakSelf.component.normalImage = normalImage;
        return weakSelf;
    };
    
    self.selectedImage = ^CICTabBarItemConstructor * _Nonnull(id  _Nonnull selectedImage) {
        weakSelf.component.selectedImage = selectedImage;
        return weakSelf;
    };
    
    self.isShowTitle = ^CICTabBarItemConstructor * _Nonnull(BOOL isShowTitle) {
        weakSelf.component.isShowTitle = isShowTitle;
        return weakSelf;
    };
}

@end

@implementation CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic {
    
    return [[CICTabBarItemConstructor alloc] initWithComponent:self];
}

@end
