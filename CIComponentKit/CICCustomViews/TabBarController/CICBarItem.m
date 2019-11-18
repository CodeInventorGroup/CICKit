//
//  CICBarItem.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/18.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICBarItem.h"

@interface CICBarItem ()

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

@implementation CICBarItem

- (instancetype)init {
    
    if (self = [super init]) {
        self.isShowTitle = YES;
    }
    return self;
}

@end

@interface CICBarItemConstructor ()

@property (nonatomic, weak) CICBarItem *component;

@end

@implementation CICBarItemConstructor

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(self) weakSelf = self;
    self.title = ^CICBarItemConstructor * _Nonnull(NSString * _Nonnull title) {
        weakSelf.component.title = title;
        return weakSelf;
    };
    
    self.normalImage = ^CICBarItemConstructor * _Nonnull(id  _Nonnull normalImage) {
        weakSelf.component.normalImage = normalImage;
        return weakSelf;
    };
    
    self.selectedImage = ^CICBarItemConstructor * _Nonnull(id  _Nonnull selectedImage) {
        weakSelf.component.selectedImage = selectedImage;
        return weakSelf;
    };
    
    self.isShowTitle = ^CICBarItemConstructor * _Nonnull(BOOL isShowTitle) {
        weakSelf.component.isShowTitle = isShowTitle;
        return weakSelf;
    };
    
    self.normalImageSize = ^CICBarItemConstructor * _Nonnull(CGSize size) {
        weakSelf.component.normalImageSize = size;
        return weakSelf;
    };
    
    self.selectedImageSize = ^CICBarItemConstructor * _Nonnull(CGSize size) {
        weakSelf.component.selectedImageSize = size;
        return weakSelf;
    };
}

@end

@implementation CICBarItem (CICConstructor)

- (CICBarItemConstructor *)cic {
    
    return [[CICBarItemConstructor alloc] initWithComponent:self];
}

@end
