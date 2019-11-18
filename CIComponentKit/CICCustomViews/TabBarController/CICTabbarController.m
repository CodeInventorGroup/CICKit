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
#import "NSArray+CICBaseProperty.h"

/// 标题Label的高度
static CGFloat const kTitleLabelHeight = 12;

@interface CICTabbarController ()<UITabBarControllerDelegate>

#pragma mark - Public Property
@property (nonatomic, copy) NSMutableArray<CICTabBarItem *> *tabBarItemData;
@property (nonatomic, copy) NSString *barBackgroundImage;
@property (nonatomic, strong) UIColor *selectedTitleColr;
@property (nonatomic, strong) UIColor *normalTitleColr;
@property (nonatomic, assign) NSUInteger selectedItemIndex;
/// 所有Item的图片大小均一样
@property (nonatomic, assign) CGSize normalImageSize;
@property (nonatomic, assign) CGSize selectedImageSize;
/// 标题和图片之间的间距
@property (nonatomic, assign) CGFloat titleImageMiddleMargin;
@property (nonatomic, copy) CICDidSelectViewControllerBlock didSelectViewControllerBlock;

#pragma mark - Private Property
@property (nonatomic, strong) NSMutableArray *tempImageViewData;

@end

@implementation CICTabbarController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
        
    NSUInteger selectedIndex = tabBarController.selectedIndex;
    NSUInteger shouldSelectIndex = [tabBarController.childViewControllers indexOfObject:viewController];
    if (selectedIndex != shouldSelectIndex) {
        CICTabBarItem *selectedTabBarItem = self.tabBarItemData[selectedIndex];
        if (selectedTabBarItem.isShowTitle != selectedTabBarItem.isShowTitleWhenSelected) {
            [self updateTabBarItemDataAtIndex:selectedIndex isShowTitle: selectedTabBarItem.isShowTitle];
        }
        
        CICTabBarItem *shouldSelectTabBarItem = self.tabBarItemData[shouldSelectIndex];
        if (shouldSelectTabBarItem.isShowTitle != shouldSelectTabBarItem.isShowTitleWhenSelected) {
            [self updateTabBarItemDataAtIndex:shouldSelectIndex isShowTitle: shouldSelectTabBarItem.isShowTitleWhenSelected];
        }
    }
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    self.selectedItemIndex = tabBarController.selectedIndex;
    if (self.didSelectViewControllerBlock) {
        self.didSelectViewControllerBlock(tabBarController.selectedIndex);
    }
}

#pragma mark - Setter Methods
- (void)setTabBarItemData:(NSArray<CICTabBarItem *> *)tabBarItemData {
    
    if (![NSArray cic_isEmpty:_tabBarItemData]) {
        return;
    }
    
    self.selectedItemIndex = 0;
    
    _tabBarItemData = [NSMutableArray arrayWithArray:tabBarItemData];
    for (CICTabBarItem *tabBarItem in tabBarItemData) {
     if ([NSString cic_isEmpty:tabBarItem.controllerClassName]) {
         tabBarItem.cic.controllerClassName(NSStringFromClass([UIViewController class]));
     }
     [self addChildViewControllerWithClassName:tabBarItem.controllerClassName];
     [self updateTabBarItemData:tabBarItem atIndex:[tabBarItemData indexOfObject:tabBarItem]];
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

- (void)setImageSize:(CGSize)imageSize {
        
    for (UIViewController *childrenViewController in self.childViewControllers) {
        NSUInteger itemIndex = [self.childViewControllers indexOfObject:childrenViewController];
        [self updateTabBarItemImageSize:imageSize forItemAtIndex:itemIndex];
    }
}

- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex {
    
    _selectedItemIndex = selectedItemIndex;
    [super setSelectedIndex:selectedItemIndex];
}

- (void)setTitleImageMiddleMargin:(CGFloat)titleImageMiddleMargin {
    
    _titleImageMiddleMargin = titleImageMiddleMargin;
    
    for (UIViewController *childrenViewController in self.childViewControllers) {
        [self updateTabBarItemTitleImagePositionAtIndex:[self.childViewControllers indexOfObject:childrenViewController]];
    }
}

#pragma mark - Private Methods
- (void)addChildViewControllerWithClassName:(NSString *)className {
    
    [self addChildViewController:[self buildChildViewControllerWithClassName:className]];
}

- (UIViewController *)buildChildViewControllerWithClassName:(NSString *)className {
    
    Class class = NSClassFromString(className);
    UIViewController *viewController = [[class alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navigation;
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName {
    
    [self updateChildViewControllerItemAtIndex:index normalImageName:normalImageName title:nil];
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName title:(NSString *)title {
    
    [self updateChildViewControllerItemAtIndex:index normalImageName:normalImageName title:title selectedImageName:nil];
}

- (void)updateAllTabBarItemData:(NSArray<CICBarItem *> *)barItemData {
    
    if ([NSArray cic_isEmpty:barItemData]) {
        return;
    }
    
    for (CICBarItem *barItem in barItemData) {
        [self updateTabBarItemData:barItem atIndex:[barItemData indexOfObject:barItem]];
    }
}

- (void)updateTabBarItemDataAtIndex:(NSInteger)index isShowTitle:(BOOL)isShowTitle {
    
    CICTabBarItem *tabBarItem = self.tabBarItemData[index];
    
    __block UIViewController *childViewController = self.childViewControllers[index];
//    if (![NSString cic_isEmpty:tabBarItem.title]) {
//      childViewController.tabBarItem.title = tabBarItem.title;
//    }
//
//    if (!tabBarItem.isShowTitle) {
//        childViewController.tabBarItem.title = nil;
//    }
    
    childViewController.tabBarItem.title = isShowTitle ? tabBarItem.title : nil;

    __weak typeof(self) weakSelf = self;
    if (tabBarItem.normalImage) {
      [self showImageWithImageParam:tabBarItem.normalImage completionBlock:^(UIImage *resultImage) {
          if (!CGSizeEqualToSize(weakSelf.normalImageSize, CGSizeZero) && !CGSizeEqualToSize(resultImage.size, weakSelf.normalImageSize)) {
              resultImage = [resultImage cic_imageScaleToSize:weakSelf.normalImageSize];
          }
          childViewController.tabBarItem.image = resultImage;
          if (!tabBarItem.selectedImage) {
              childViewController.tabBarItem.selectedImage = [resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
          }
      }];
    }
    if (tabBarItem.selectedImage) {
      [self showImageWithImageParam:tabBarItem.selectedImage completionBlock:^(UIImage *resultImage) {
          UIImage *selectedImage = [resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
          if (!CGSizeEqualToSize(weakSelf.selectedImageSize, CGSizeZero) && !CGSizeEqualToSize(selectedImage.size, weakSelf.selectedImageSize)) {
              selectedImage = [selectedImage cic_imageScaleToSize:weakSelf.selectedImageSize];
          }
          childViewController.tabBarItem.selectedImage = selectedImage;
      }];
    }

    [self updateTabBarItemImageInsetsAtIndex:index];
    [self updateTabBarItemTitleImagePositionAtIndex:index];
}

- (void)updateTabBarItemData:(CICBarItem *)tabBarItem atIndex:(NSInteger)index {
    
    if ([NSArray cic_isEmpty:self.childViewControllers] || self.childViewControllers.count <= index) {
        return;
    }
    
    CICTabBarItem *tempTabBarItem = (CICTabBarItem *)tabBarItem;
    tempTabBarItem.cic.controllerClassName(self.tabBarItemData[index].controllerClassName);
    [_tabBarItemData replaceObjectAtIndex:index withObject:tempTabBarItem];
    
    [self updateTabBarItemDataAtIndex:index isShowTitle:index == self.selectedItemIndex ? tabBarItem.isShowTitleWhenSelected : tabBarItem.isShowTitle];
}

- (void)updateChildViewControllerItemAtIndex:(NSUInteger)index normalImageName:(NSString *)normalImageName title:(NSString *)title selectedImageName:(NSString *)selectedImageName {
    
    if ([NSArray cic_isEmpty:self.childViewControllers] || self.childViewControllers.count <= index) {
        return;
    }
    
    __block UIViewController *childViewController = self.childViewControllers[index];
    if (![NSString cic_isEmpty:title]) {
        childViewController.tabBarItem.title = title;
    }
    
    __weak typeof(self) weakSelf = self;
    if (normalImageName) {
        [self showImageWithImageParam:normalImageName completionBlock:^(UIImage *resultImage) {
            if (!CGSizeEqualToSize(resultImage.size, weakSelf.normalImageSize)) {
                resultImage = [resultImage cic_imageScaleToSize:weakSelf.normalImageSize];
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
            if (!CGSizeEqualToSize(selectedImage.size, weakSelf.selectedImageSize)) {
                selectedImage = [selectedImage cic_imageScaleToSize:weakSelf.selectedImageSize];
            }
            childViewController.tabBarItem.selectedImage = selectedImage;
        }];
    }

    [self updateTabBarItemImageInsetsAtIndex:index];
}

- (void)updateTabBarItemImageInsets {
    
    for (UIViewController *childrenViewController in self.childViewControllers) {
        [self updateTabBarItemImageInsetsAtIndex:[self.childViewControllers indexOfObject:childrenViewController]];
    }
}

- (void)updateTabBarItemImageInsetsAtIndex:(NSInteger)index {
    
    UIViewController *childViewController = self.childViewControllers[index];
    if (![NSString cic_isEmpty:childViewController.tabBarItem.title]) {
        return;
    }
    
    CGSize imageSize = childViewController.tabBarItem.image.size;
    
    CGFloat estimateTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height) / 2.0;
    CGFloat finishedTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - imageSize.height) / 2.0;
    CGFloat margin = finishedTopMargin - estimateTopMargin;
    childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(margin, 0, -margin, 0);
}

- (void)updateTabBarItemTitleImagePositionAtIndex:(NSInteger)index {
    
    UIViewController *childViewController = self.childViewControllers[index];
    if ([NSString cic_isEmpty:childViewController.tabBarItem.title]) {
        return;
    }
    
    CGSize imageSize = childViewController.tabBarItem.image.size;
    
    CGFloat margin = self.titleImageMiddleMargin;
    if (imageSize.height + margin + kTitleLabelHeight > CIC_TAB_BAR_HEIGHT - 1) {
        margin = CIC_TAB_BAR_HEIGHT - 1 - imageSize.height - kTitleLabelHeight;
    }
    
    CGFloat estimateTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height) / 2.0;
    CGFloat finishedTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height - margin)/2.0;
    CGFloat imageTopMargin = finishedTopMargin - estimateTopMargin;
    childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(imageTopMargin, 0, -imageTopMargin, 0);
    CGFloat titleVerticalOffset = finishedTopMargin + imageSize.height + margin - (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight);
    childViewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, titleVerticalOffset);
}

- (void)updateTabBarItemImageSize:(CGSize)imageSize forItemAtIndex:(NSUInteger)index {
    
    UIViewController *childViewController = self.childViewControllers[index];
    UIImage *normalImage = childViewController.tabBarItem.image;
    normalImage = [normalImage cic_imageScaleToSize:imageSize];
    childViewController.tabBarItem.image = normalImage;
    
    UIImage *selectedImage = childViewController.tabBarItem.selectedImage;
    selectedImage = [selectedImage cic_imageScaleToSize:imageSize];
    childViewController.tabBarItem.selectedImage = selectedImage;
    
    [self updateTabBarItemImageInsetsAtIndex:index];
    [self updateTabBarItemTitleImagePositionAtIndex:index];
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
    _tabBarItemData = ^CICTabbarControllerConstructor * _Nonnull(NSArray<CICTabBarItem *> * _Nonnull tabBarItemData) {
        weakSelf.component.tabBarItemData = [NSMutableArray arrayWithArray:tabBarItemData];
        return weakSelf;
    };
    
    _updateBarItemData = ^CICTabbarControllerConstructor * _Nonnull(CICBarItem * _Nonnull item, NSInteger itemIndex) {
        [weakSelf.component updateTabBarItemData:item atIndex:itemIndex];
        return weakSelf;
    };
    
    _updateAllBarItemData = ^CICTabbarControllerConstructor * _Nonnull(NSArray<CICBarItem *> * _Nonnull barItemData) {
        [weakSelf.component updateAllTabBarItemData:barItemData];
        return weakSelf;
    };
    
    _selectedTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull selectedColor) {
        weakSelf.component.selectedTitleColr = selectedColor;
        return weakSelf;
    };
    
    _normalTextColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull normalColor) {
        weakSelf.component.normalTitleColr = normalColor;
        return weakSelf;
    };
    
    _barBackgroundColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull color) {
        weakSelf.component.tabBar.backgroundImage = [UIImage cic_imageWithColor:color imageSize:CGSizeMake(CIC_SCREEN_WIDTH, 1)];
        return weakSelf;
    };
    
    _barBackgroundImage = ^CICTabbarControllerConstructor * _Nonnull(NSString * _Nonnull backgroundImage) {
        weakSelf.component.barBackgroundImage = backgroundImage;
        return weakSelf;
    };
    
    _badgeValue = ^CICTabbarControllerConstructor * _Nonnull(NSUInteger index, NSString *value) {
        weakSelf.component.childViewControllers[index].tabBarItem.badgeValue = value;
        return weakSelf;
    };
    
    _selectedItemIndex = ^CICTabbarControllerConstructor * _Nonnull(NSUInteger selectedIndex) {
        weakSelf.component.selectedItemIndex = selectedIndex;
        return weakSelf;
    };
    
    _titleImageMiddleMargin = ^CICTabbarControllerConstructor * _Nonnull(CGFloat titleImageMiddleMargin) {
        weakSelf.component.titleImageMiddleMargin = titleImageMiddleMargin;
        return weakSelf;
    };
    
    _normalImageSize = ^CICTabbarControllerConstructor * _Nonnull(CGSize imageSize) {
        weakSelf.component.normalImageSize = imageSize;
        return weakSelf;
    };
    
    _selectedImageSize = ^CICTabbarControllerConstructor * _Nonnull(CGSize imageSize) {
        weakSelf.component.selectedImageSize = imageSize;
        return weakSelf;
    };
    
    _didSelectViewControllerBlock = ^CICTabbarControllerConstructor * _Nonnull(CICDidSelectViewControllerBlock  _Nonnull selectBlock) {
        weakSelf.component.didSelectViewControllerBlock = selectBlock;
        return weakSelf;
    };
}

@end

@implementation CICTabbarController (CICConstructor)

- (CICTabbarControllerConstructor *)cic {
    
    return [[CICTabbarControllerConstructor alloc] initWithComponent:self];
}

@end
