//
//  CICTabbarController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//  封装 TabbarController
//

#import "CICTabbarController.h"
#import <SDWebImage/SDWebImage.h>
#import "NSString+CICNetwork.h"
#import "NSDate+CICString.h"
#import "UIImage+CICSize.h"
#import "UIImage+CICColor.h"
#import "NSString+CICBaseProperty.h"

static CGSize const kTabBarImageSize = {23,23};

@interface CICTabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableArray *tempImageViewData;

@end

@implementation CICTabbarController

#pragma mark - Life Cycle
- (instancetype)init {
    if (self = [super init]) {
        self.imageSize = kTabBarImageSize;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        self.imageSize = kTabBarImageSize;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.imageSize = kTabBarImageSize;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    if (self.didSelectedTabbarBlock) {
        self.didSelectedTabbarBlock(tabBarController.selectedIndex);
    }
}

#pragma mark - Setter Methods
- (void)setTabBarItemData:(NSArray<CICTabBarItem *> *)tabBarItemData {
    
    _tabBarItemData = tabBarItemData;
    for (CICTabBarItem *tabBarItem in tabBarItemData) {
        if ([NSString cic_isEmpty:tabBarItem.controllerClassName]) {
            tabBarItem.controllerClassName = NSStringFromClass([UIViewController class]);
        }
        [self addChildViewControllerWithClassName:tabBarItem.controllerClassName];
        [self updateChildViewControllerItemAtIndex:[tabBarItemData indexOfObject:tabBarItem] normalImageName:tabBarItem.normalImage title:tabBarItem.title selectedImageName:tabBarItem.selectedImage];
    }
}

- (void)setClassNameData:(NSArray *)classNameData {
    
    _classNameData = classNameData;
    for (NSString *className in classNameData) {
        [self addChildViewControllerWithClassName:className];
    }
}

- (void)setItemDataNormalImage:(NSArray *)itemDataNormalImage {
    
    _itemDataNormalImage = itemDataNormalImage;
    for (NSString *data in itemDataNormalImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataNormalImage indexOfObject:data] normalImageName:data];
    }
}

- (void)setItemDataTitleNormalImage:(NSArray *)itemDataTitleNormalImage {
    
    _itemDataTitleNormalImage = itemDataTitleNormalImage;
    for (NSArray *data in itemDataTitleNormalImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataTitleNormalImage indexOfObject:data] normalImageName:data.lastObject title:data.firstObject];
    }
}

- (void)setItemDataNormalSelectedImage:(NSArray *)itemDataNormalSelectedImage {
    
    _itemDataNormalSelectedImage = itemDataNormalSelectedImage;
    for (NSArray *data in itemDataNormalSelectedImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataNormalSelectedImage indexOfObject:data] normalImageName:data.firstObject title:nil selectedImageName:data.lastObject];
    }
}

- (void)setItemDataTitleNormalSelectedImage:(NSArray *)itemDataTitleNormalSelectedImage {
    
    _itemDataTitleNormalSelectedImage = itemDataTitleNormalSelectedImage;
    for (NSArray *data in itemDataTitleNormalSelectedImage) {
        [self updateChildViewControllerItemAtIndex:[itemDataTitleNormalSelectedImage indexOfObject:data] normalImageName:data[1] title:data.firstObject selectedImageName:data.lastObject];
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

- (void)setNormalTitleColr:(UIColor *)normalTitleColr {
    
    _normalTitleColr = normalTitleColr;
    
    for (UIViewController *childViewController in self.childViewControllers) {
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: normalTitleColr} forState:UIControlStateNormal];
    }
}

- (void)setSelectedTitleColr:(UIColor *)selectedTitleColr {
    
    _selectedTitleColr = selectedTitleColr;
    
    for (UIViewController *childViewController in self.childViewControllers) {
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: selectedTitleColr} forState:UIControlStateSelected];
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
    if (![NSString cic_isEmpty:title]) {
        childViewController.tabBarItem.title = title;
    }
    
    __weak typeof(self) weakSelf = self;
    if (normalImageName) {
        [self showImageWithImageParam:normalImageName completionBlock:^(UIImage *resultImage) {
            if (!CGSizeEqualToSize(resultImage.size, self.imageSize)) {
                resultImage = [resultImage cic_imageScaleToSize:self.imageSize];
            }
            childViewController.tabBarItem.image = resultImage;
            if (!selectedImageName) {
                childViewController.tabBarItem.selectedImage = [resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            }
        }];
    }
    if (selectedImageName) {
        [self showImageWithImageParam:selectedImageName completionBlock:^(UIImage *resultImage) {
            UIImage *selectedImage = [resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            if (!CGSizeEqualToSize(selectedImage.size, weakSelf.imageSize)) {
                selectedImage = [selectedImage cic_imageScaleToSize:weakSelf.imageSize];
            }
            childViewController.tabBarItem.selectedImage = selectedImage;
        }];
    }
    if (@available(iOS 13.0, *)) {
  
    }else {
        if ([NSString cic_isEmpty:title]) {
            CGFloat margin = (CIC_TAB_BAR_HEIGHT - 1 - self.imageSize.height)/2.0 - 1;
            childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(margin, 0, -margin, 0);
        }
    }
}

- (void)showImageWithImageParam:(id)imageParam completionBlock:(void(^)(UIImage *))completionBlock {
    
    if (!imageParam || !completionBlock) {
        return;
    }
    
    __block UIImage *resultImage = nil;
    if ([imageParam isKindOfClass:[NSString class]]) {
        NSString *imageString = (NSString *)imageParam;
        if ([imageString cic_isUrl]) {
            UIImageView *imageView = [[UIImageView alloc] init];
            
            __weak typeof(self) weakSelf = self;
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageString] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                if (!error) {
                    completionBlock(image);
                }
                [weakSelf.tempImageViewData removeObject:imageView];
                if (weakSelf.tempImageViewData.count == 0) {
                    weakSelf.tempImageViewData = nil;
                }
            }];
            [self.tempImageViewData addObject:imageView];
        }else {
            resultImage = [UIImage imageNamed:imageString];
        }
    }else if ([imageParam isKindOfClass:[NSData class]]) {
        resultImage = [UIImage sd_imageWithData:(NSData *)imageParam scale:[UIScreen mainScreen].scale];
    }else if ([imageParam isKindOfClass:[UIImage class]]) {
        resultImage = (UIImage *)imageParam;
    }
    
    if (resultImage) {
        completionBlock(resultImage);
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
    self.tabBarItemData = ^CICTabbarControllerConstructor * _Nonnull(NSArray<CICTabBarItem *> * _Nonnull tabBarItemData) {
        weakSelf.component.tabBarItemData = tabBarItemData;
        return weakSelf;
    };
    
    self.classNameData = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull classNameData) {
        weakSelf.component.classNameData = classNameData;
        return weakSelf;
    };
    
    self.itemDataNormalImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataNormalImage) {
        weakSelf.component.itemDataNormalImage = itemDataNormalImage;
        return weakSelf;
    };
    
    self.itemDataTitleNormalImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataTitleNormalImage) {
        weakSelf.component.itemDataTitleNormalImage = itemDataTitleNormalImage;
        return weakSelf;
    };
    
    self.itemDataTitleNormalSelectedImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataTitleNormalSelectedImage) {
        weakSelf.component.itemDataTitleNormalSelectedImage = itemDataTitleNormalSelectedImage;
        return weakSelf;
    };
    
    self.selectedTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull selectedColor) {
        weakSelf.component.selectedTitleColr = selectedColor;
        return weakSelf;
    };
    
    self.normalTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull normalColor) {
        weakSelf.component.normalTitleColr = normalColor;
        return weakSelf;
    };
    
    self.itemDataNormalSelectedImage = ^CICTabbarControllerConstructor * _Nonnull(NSArray * _Nonnull itemDataNormalSelectedImage) {
        weakSelf.component.itemDataNormalSelectedImage = itemDataNormalSelectedImage;
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
    
    self.imageSize = ^CICTabbarControllerConstructor * _Nonnull(CGSize imageSize) {
        weakSelf.component.imageSize = imageSize;
        return weakSelf;
    };
    
    self.badgeValue = ^CICTabbarControllerConstructor * _Nonnull(NSUInteger index, NSString *value) {
        weakSelf.component.childViewControllers[index].tabBarItem.badgeValue = value;
        return weakSelf;
    };
    
    self.selectedIndex = ^CICTabbarControllerConstructor * _Nonnull(NSUInteger selectedIndex) {
        weakSelf.component.selectedIndex = selectedIndex;
        return weakSelf;
    };
}

@end

@implementation CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic {
    
    return [[CICTabbarControllerConstructor alloc] initWithComponent:self];
}

@end
