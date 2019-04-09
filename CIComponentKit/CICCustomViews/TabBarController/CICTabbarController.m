//
//  CICTabbarController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//  封装 TabbarController
//

#import "CICTabbarController.h"
#import <UIImageView+WebCache.h>
#import "NSString+CICNetwork.h"
#import "UIImage+CICColor.h"
#import "UIImage+CICSize.h"

@interface CICTabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableArray *tempImageViewData;

@end

@implementation CICTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"didSelectViewController %ld", tabBarController.selectedIndex);
}

#pragma mark - Setter Methods
- (void)setClassNameData:(NSArray *)classNameData {
    
    _classNameData = classNameData;
    for (NSString *className in classNameData) {
        [self addChildViewControllerWithClassName:className];
    }
}

- (void)setItemDataNoTitleSelectedImage:(NSArray *)itemDataNoTitleSelectedImage {
    
    _itemDataNoTitleSelectedImage = itemDataNoTitleSelectedImage;
    for (NSString *data in itemDataNoTitleSelectedImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataNoTitleSelectedImage indexOfObject:data] normalImageName:data];
    }
}

- (void)setItemDataNoSelectedImage:(NSArray *)itemDataNoSelectedImage {
    
    _itemDataNoSelectedImage = itemDataNoSelectedImage;
    for (NSArray *data in itemDataNoSelectedImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataNoSelectedImage indexOfObject:data] normalImageName:data.lastObject title:data.firstObject];
    }
}

- (void)setItemDataNoTitle:(NSArray *)itemDataNoTitle {
    
    _itemDataNoTitle = itemDataNoTitle;
    for (NSArray *data in itemDataNoTitle) {
        [self updateChildViewControllerItemAtIndex:[itemDataNoTitle indexOfObject:data] normalImageName:data.firstObject title:nil selectedImageName:data.lastObject];
    }
}

- (void)setItemData:(NSArray *)itemData {
    
    _itemData = itemData;
    for (NSArray *data in itemData) {
        [self updateChildViewControllerItemAtIndex:[itemData indexOfObject:data] normalImageName:data[1] title:data.firstObject selectedImageName:data.lastObject];
    }
}

- (void)setBarBackgroundImage:(NSString *)barBackgroundImage {
    
    _barBackgroundImage = barBackgroundImage;
    if ([barBackgroundImage cic_isUrl]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        [imageView sd_setImageWithURL:[NSURL URLWithString:barBackgroundImage] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                weakSelf.tabBar.backgroundImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                [weakSelf.tempImageViewData removeObject:imageView];
                if (weakSelf.tempImageViewData.count == 0) {
                    weakSelf.tempImageViewData = nil;
                }
            }
        }];
        [self.tempImageViewData addObject:imageView];
    }else {
        self.tabBar.backgroundImage = [UIImage imageNamed:barBackgroundImage];
    }
}

#pragma mark - Private Methods
- (void)addChildViewControllerWithClassName:(NSString *)className {
    
    Class class = NSClassFromString(className);
    UIViewController *viewController = [[class alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigation];
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName {
    
    [self updateChildViewControllerItemAtIndex:index normalImageName:normalImageName title:nil];
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName title:(NSString *)title {
    
    [self updateChildViewControllerItemAtIndex:index normalImageName:normalImageName title:title selectedImageName:nil];
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName title:(NSString *)title selectedImageName:(NSString *)selectedImageName {
    
    __block UIViewController *childViewController = self.childViewControllers[index];
    __weak typeof(self) weakSelf = self;
    if (title) {    
        childViewController.tabBarItem.title = title;
    }
    if ([normalImageName cic_isUrl]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:normalImageName] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                UIImage *scaleSizeImage = [UIImage cic_imageWithImage:image scaledToSize:CGSizeMake(23, 23)];
                childViewController.tabBarItem.image = [scaleSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                if (!selectedImageName) {
                    childViewController.tabBarItem.selectedImage = [scaleSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }
            }
            [weakSelf.tempImageViewData removeObject:imageView];
            if (weakSelf.tempImageViewData.count == 0) {
                weakSelf.tempImageViewData = nil;
            }
        }];
        [self.tempImageViewData addObject:imageView];
    }else {
        childViewController.tabBarItem.image = [UIImage imageNamed:normalImageName];
    }
    if (selectedImageName && [selectedImageName cic_isUrl]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:selectedImageName] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                UIImage *scaleSizeImage = [UIImage cic_imageWithImage:image scaledToSize:CGSizeMake(23, 23)];
                childViewController.tabBarItem.selectedImage = [scaleSizeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                
            }
            [weakSelf.tempImageViewData removeObject:imageView];
            if (weakSelf.tempImageViewData.count == 0) {
                weakSelf.tempImageViewData = nil;
            }
        }];
        [self.tempImageViewData addObject:imageView];
    }else {
        childViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    }
}

#pragma mark - Lazy Load
- (NSArray *)tempImageViewData {
    
    if (!_tempImageViewData) {
        _tempImageViewData = [NSMutableArray array];
    }
    return _tempImageViewData;
}

@end

@interface CICTabbarControllerConstructor()

@property (nonatomic, weak) CICTabbarController *component;

@end

@implementation CICTabbarControllerConstructor

- (void)buildConstructor {
    
    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    self.classNameData = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull classNameData) {
        weakSelf.component.classNameData = classNameData;
        return weakSelf;
    };
    
    self.itemDataNoTitleSelectedImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataNoTitleSelectedImage) {
        weakSelf.component.itemDataNoTitleSelectedImage = itemDataNoTitleSelectedImage;
        return weakSelf;
    };
    
    self.itemDataNoSelectedImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataNoSelectedImage) {
        weakSelf.component.itemDataNoSelectedImage = itemDataNoSelectedImage;
        return weakSelf;
    };
    
    self.itemData = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemData) {
        weakSelf.component.itemData = itemData;
        return weakSelf;
    };
    
    self.selectedTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull selectedColor) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: selectedColor} forState:UIControlStateSelected];
        return weakSelf;
    };
    
    self.normalTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull normalColor) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: normalColor} forState:UIControlStateNormal];
        return weakSelf;
    };
    
    self.itemDataNoTitle = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataNoTitle) {
        weakSelf.component.itemDataNoTitle = itemDataNoTitle;
        return weakSelf;
    };
    
    self.barBackgroundColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull color) {
        weakSelf.component.tabBar.backgroundImage = [UIImage cic_imageWithColor:color imageSize:CGSizeMake(CIC_SCREEN_WIDTH, 1)];
        return weakSelf;
    };
    
    self.barBackgroundImage = ^CICTabbarControllerConstructor * _Nonnull(NSString * _Nonnull backgroundImage) {
        weakSelf.component.barBackgroundImage = backgroundImage;
        return weakSelf;
    };
}

@end

@implementation CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic {
    
    return [[CICTabbarControllerConstructor alloc] initWithComponent:self];
}

@end
