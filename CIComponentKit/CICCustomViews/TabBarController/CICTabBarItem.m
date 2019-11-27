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

@end

@implementation CICTabBarItem

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
    .isShowTitle(isShowTitle)
    .isShowTitleWhenSelected(isShowTitle);
    return tabBarItem;
}

@end

@interface CICTabBarItemConstructor ()

@property (nonatomic, weak) CICTabBarItem *component;

@end

@implementation CICTabBarItemConstructor

@dynamic title;
@dynamic normalImage;
@dynamic selectedImage;

@dynamic normalImageSize;
@dynamic selectedImageSize;
@dynamic isShowTitle;
@dynamic isShowTitleWhenSelected;
@dynamic normalTitleColor;
@dynamic selectedTitleColor;

- (void)buildConstructor {
    
    [super buildConstructor];
    
    WEAK_SELF;
    _controllerClassName = ^CICTabBarItemConstructor * _Nonnull(NSString * _Nonnull controllerClassName) {
        weakSelf.component.controllerClassName = controllerClassName;
        return weakSelf;
    };
}

@end

@implementation CICTabBarItem (CICConstructor)

- (CICTabBarItemConstructor *)cic {
    
    return [[CICTabBarItemConstructor alloc] initWithComponent:self];
}

@end
