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
@property (nonatomic, assign) BOOL isShowTitleWhenSelected;
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
        self.isShowTitleWhenSelected = YES;
        
        self.normalImage = NULL;
        self.selectedImage = NULL;
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
    
    WEAK_SELF;
    _title = ^CICBarItemConstructor * _Nonnull(NSString * _Nonnull title) {
        weakSelf.component.title = title;
        return weakSelf;
    };
    
    _normalImage = ^CICBarItemConstructor * _Nonnull(id  _Nonnull normalImage) {
        weakSelf.component.normalImage = normalImage;
        return weakSelf;
    };
    
    _selectedImage = ^CICBarItemConstructor * _Nonnull(id  _Nonnull selectedImage) {
        weakSelf.component.selectedImage = selectedImage;
        return weakSelf;
    };
    
    _isShowTitle = ^CICBarItemConstructor * _Nonnull(BOOL isShowTitle) {
        weakSelf.component.isShowTitle = isShowTitle;
        return weakSelf;
    };
    
    _isShowTitleWhenSelected = ^CICBarItemConstructor * _Nonnull(BOOL isShow) {
        weakSelf.component.isShowTitleWhenSelected = isShow;
        return weakSelf;
    };
    
    _normalImageSize = ^CICBarItemConstructor * _Nonnull(CGSize size) {
        weakSelf.component.normalImageSize = size;
        return weakSelf;
    };
    
    _selectedImageSize = ^CICBarItemConstructor * _Nonnull(CGSize size) {
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
