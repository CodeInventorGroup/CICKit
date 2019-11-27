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
#import "NSObject+CICCheck.h"

/// 标题Label的高度
static CGFloat const kTitleLabelHeight = 12;

@interface CICTabbarController ()<UITabBarControllerDelegate>

#pragma mark - Public Property
@property (nonatomic, copy) NSMutableArray<CICTabBarItem *> *tabBarItemData;
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
        UIViewController *selectedViewController = tabBarController.childViewControllers[selectedIndex];
        if (selectedTabBarItem.isShowTitle != selectedTabBarItem.isShowTitleWhenSelected || !CGSizeEqualToSize(selectedViewController.tabBarItem.image.size, selectedViewController.tabBarItem.selectedImage.size)) {
            [self updateTabBarItemTitleAtIndex:selectedIndex isShowTitle:selectedTabBarItem.isShowTitle];
            [self updateTabBarItemPositionAtIndex:selectedIndex selectedItemIndex:shouldSelectIndex];
        }
        
        CICTabBarItem *shouldSelectTabBarItem = self.tabBarItemData[shouldSelectIndex];
        if (shouldSelectTabBarItem.isShowTitle != shouldSelectTabBarItem.isShowTitleWhenSelected || !CGSizeEqualToSize(viewController.tabBarItem.image.size, viewController.tabBarItem.selectedImage.size)) {
            [self updateTabBarItemTitleAtIndex:shouldSelectIndex isShowTitle:shouldSelectTabBarItem.isShowTitleWhenSelected];
            [self updateTabBarItemPositionAtIndex:shouldSelectIndex selectedItemIndex:shouldSelectIndex];
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

- (void)setBarBackgroundImage:(id)barBackgroundImage {
    
    _barBackgroundImage = barBackgroundImage;
    WEAK_SELF;
    [self showImageWithImageParam:barBackgroundImage completionBlock:^(UIImage *resultImage) {
        weakSelf.tabBar.backgroundImage = resultImage;
    }];
}

- (void)setNormalTitleColr:(UIColor *)normalTitleColr {
    
    _normalTitleColr = normalTitleColr;
    
    for (UIViewController *childViewController in self.childViewControllers) {
        NSUInteger index = [self.childViewControllers indexOfObject:childViewController];
        if (![NSArray cic_isEmpty:self.tabBarItemData] && self.tabBarItemData.count > index) {
            CICTabBarItem *tabBarItem = self.tabBarItemData[index];
            if (tabBarItem.normalTitleColor) {
                continue;
            }
        }
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: normalTitleColr} forState:UIControlStateNormal];
    }
}

- (void)setSelectedTitleColr:(UIColor *)selectedTitleColr {
    
    _selectedTitleColr = selectedTitleColr;
    
    for (UIViewController *childViewController in self.childViewControllers) {
        NSUInteger index = [self.childViewControllers indexOfObject:childViewController];
         if (![NSArray cic_isEmpty:self.tabBarItemData] && self.tabBarItemData.count > index) {
             CICTabBarItem *tabBarItem = self.tabBarItemData[index];
             if (tabBarItem.selectedTitleColor) {
                 continue;
             }
         }
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: selectedTitleColr} forState:UIControlStateSelected];
    }
}

- (void)setSelectedItemIndex:(NSUInteger)selectedItemIndex {
    
    _selectedItemIndex = selectedItemIndex;
    [super setSelectedIndex:selectedItemIndex];
}

- (void)setTitleImageMiddleMargin:(CGFloat)titleImageMiddleMargin {
    
    _titleImageMiddleMargin = titleImageMiddleMargin;
    
    for (UIViewController *childrenViewController in self.childViewControllers) {
        [self updateTabBarItemPositionAtIndex:[self.childViewControllers indexOfObject:childrenViewController] selectedItemIndex:self.selectedItemIndex];
    }
}

- (void)setNormalImageSize:(CGSize)normalImageSize {
    
    _normalImageSize = normalImageSize;
    if (![NSArray cic_isEmpty:_tabBarItemData]) {
        [self updateAllTabBarItemData:[NSArray arrayWithArray:_tabBarItemData]];
    }
}

- (void)setSelectedImageSize:(CGSize)selectedImageSize {
    
    _selectedImageSize = selectedImageSize;
    if (![NSArray cic_isEmpty:_tabBarItemData]) {
        [self updateAllTabBarItemData:[NSArray arrayWithArray:_tabBarItemData]];
    }
}

#pragma mark - Private Methods
- (void)addChildViewControllerWithClassName:(NSString *)className {
    
    Class class = NSClassFromString(className);
    UIViewController *viewController = [[class alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigation];
}

- (void)updateAllTabBarItemData:(NSArray<CICBarItem *> *)barItemData {
    
    if ([NSArray cic_isEmpty:barItemData]) {
        return;
    }
    
    for (CICBarItem *barItem in barItemData) {
        [self updateTabBarItemData:barItem atIndex:[barItemData indexOfObject:barItem]];
    }
}

- (void)updateTabBarItemData:(CICBarItem *)tabBarItem atIndex:(NSInteger)index {
    
    if ([NSArray cic_isEmpty:self.childViewControllers] || self.childViewControllers.count <= index) {
        return;
    }
    
    CICTabBarItem *tempTabBarItem = (CICTabBarItem *)tabBarItem;
    tempTabBarItem.cic.controllerClassName(self.tabBarItemData[index].controllerClassName);
    [_tabBarItemData replaceObjectAtIndex:index withObject:tempTabBarItem];
    
    [self updateTabBarItemDataAtIndex:index isShowTitle:index == self.selectedItemIndex ? tabBarItem.isShowTitleWhenSelected : tabBarItem.isShowTitle selectedItemIndex:self.selectedItemIndex];
}

- (void)updateTabBarItemDataAtIndex:(NSInteger)index isShowTitle:(BOOL)isShowTitle selectedItemIndex:(NSUInteger)selectedItemIndex {

    [self updateTabBarItemTitleAtIndex:index isShowTitle:isShowTitle];
    [self updateTabBarItemImageAtIndex:index selectedItemIndex:selectedItemIndex];
}

- (void)updateTabBarItemTitleAtIndex:(NSInteger)index isShowTitle:(BOOL)isShowTitle {
    
    UIViewController *childViewController = self.childViewControllers[index];
    CICTabBarItem *tabBarItem = self.tabBarItemData[index];
    childViewController.tabBarItem.title = isShowTitle ? tabBarItem.title : nil;
    
    if (tabBarItem.normalTitleColor) {
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: tabBarItem.normalTitleColor} forState:UIControlStateNormal];
    }
    if (tabBarItem.selectedTitleColor) {
        [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: tabBarItem.selectedTitleColor} forState:UIControlStateSelected];
    }
}

- (void)updateTabBarItemImageAtIndex:(NSUInteger)index selectedItemIndex:(NSUInteger)selectedItemIndex {
    
    __block UIViewController *childViewController = self.childViewControllers[index];
    CICTabBarItem *tabBarItem = self.tabBarItemData[index];
    WEAK_SELF;
    if ([NSObject cic_isValid:tabBarItem.normalImage]) {
     [self showImageWithImageParam:tabBarItem.normalImage completionBlock:^(UIImage *resultImage) {
         childViewController.tabBarItem.image = [weakSelf scaleImageSizeWithImage:resultImage forItem:tabBarItem isSelected:NO];
         if (![NSObject cic_isValid:tabBarItem.selectedImage]) {
             childViewController.tabBarItem.selectedImage = [weakSelf scaleImageSizeWithImage:resultImage forItem:tabBarItem isSelected:YES];
         }
         [weakSelf updateTabBarItemPositionAtIndex:index selectedItemIndex:selectedItemIndex];
     }];
    }
    if ([NSObject cic_isValid:tabBarItem.selectedImage]) {
     [self showImageWithImageParam:tabBarItem.selectedImage completionBlock:^(UIImage *resultImage) {
         childViewController.tabBarItem.selectedImage = [weakSelf scaleImageSizeWithImage:resultImage forItem:tabBarItem isSelected:YES];
         [weakSelf updateTabBarItemPositionAtIndex:index selectedItemIndex:selectedItemIndex];
     }];
    }
}

- (UIImage *)scaleImageSizeWithImage:(UIImage *)image forItem:(CICTabBarItem *)tabBarItem isSelected:(BOOL)isSelected {
    
    UIImage *resultImage = image;
    CGSize imageSize;
    if (isSelected) {
        imageSize = CGSizeEqualToSize(tabBarItem.selectedImageSize, CGSizeZero) ? self.selectedImageSize : tabBarItem.selectedImageSize;
    }else {
        imageSize = CGSizeEqualToSize(tabBarItem.normalImageSize, CGSizeZero) ? self.normalImageSize : tabBarItem.normalImageSize;
    }
    if (CGSizeEqualToSize(imageSize, CGSizeZero)) {
        imageSize = resultImage.size;
    }
    imageSize = [self getAvailableSize:imageSize];
    
    if (!CGSizeEqualToSize(imageSize, CGSizeZero) && !CGSizeEqualToSize(resultImage.size, imageSize)) {
      resultImage = [resultImage cic_imageScaleToSize:imageSize];
    }
    if (isSelected) {
        resultImage = [resultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return resultImage;
}

- (void)updateTabBarItemPositionAtIndex:(NSUInteger)index selectedItemIndex:(NSUInteger)selectedItemIndex {
    
    if ([NSArray cic_isEmpty:self.childViewControllers] || self.childViewControllers.count < index) {
        return;
    }
    
    UIViewController *childViewController = self.childViewControllers[index];
    CGSize imageSize = selectedItemIndex == index ? childViewController.tabBarItem.selectedImage.size : childViewController.tabBarItem.image.size;
    imageSize = [self getAvailableSize:imageSize];

    if ([NSString cic_isEmpty:childViewController.tabBarItem.title]) {
        CGFloat estimateTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height) / 2.0;
        CGFloat finishedTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - imageSize.height) / 2.0;
        CGFloat margin = finishedTopMargin - estimateTopMargin;
        childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(margin, 0, -margin, 0);
    }else {
        CGFloat margin = self.titleImageMiddleMargin;
        if (imageSize.height + margin + kTitleLabelHeight > CIC_TAB_BAR_HEIGHT - 1) {
            margin = CIC_TAB_BAR_HEIGHT - 1 - imageSize.height - kTitleLabelHeight;
        }
        CGFloat estimateTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height) / 2.0;
        CGFloat finishedTopMargin = (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - imageSize.height - margin)/2.0;
        CGFloat imageTopMargin = finishedTopMargin - estimateTopMargin;
        childViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(imageTopMargin, 0, -imageTopMargin, 0);

        CGFloat titleVerticalOffset = finishedTopMargin + imageSize.height + margin - (CIC_TAB_BAR_HEIGHT - 1 - kTitleLabelHeight - 1);
        if (@available(iOS 13.0, *)) {
            //  iOS 13以上，UITabBarButtonLabel默认顶部间距由35变为34+1/3(iphone8P及以上设备)、34.5(iphone8以下设备)两种
            //  间距微调加1后，系统会自动调整使得间距与需要设置的间距相差约1/2-1/3的距离，基本满足条件
            titleVerticalOffset += 1;
        }
        childViewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, titleVerticalOffset);
    }
}

- (void)showImageWithImageParam:(id)imageParam completionBlock:(void(^)(UIImage *))completionBlock {
    
    if (!imageParam || !completionBlock) {
        return;
    }
    
    __block UIImage *resultImage = nil;
    if ([imageParam isKindOfClass:[NSString class]]) {
        NSString *imageString = (NSString *)imageParam;
        if ([NSString cic_isEmpty:imageString]) {
            return;
        }
        
        if ([imageString cic_isUrl]) {
            UIImageView *imageView = [[UIImageView alloc] init];
            
            WEAK_SELF;
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

- (CGSize)getAvailableSize:(CGSize)size {
    
    CGSize tempSize = size;
    if ((NSInteger)tempSize.height % 2 == 1) {
        tempSize = CGSizeMake((NSInteger)tempSize.width + 1, (NSInteger)tempSize.height + 1);
    }
    return tempSize;
}

- (BOOL)isShowTabBarItemTitleColorAtIndex:(NSUInteger)index forState:(UIControlState)state {
    
    if (![NSArray cic_isEmpty:self.tabBarItemData] && self.tabBarItemData.count > index) {
        CICTabBarItem *tabBarItem = self.tabBarItemData[index];
        if ((state == UIControlStateSelected && tabBarItem.selectedTitleColor) || (state == UIControlStateNormal && tabBarItem.normalTitleColor)) {
            return YES;
        }
    }
    return NO;
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
    
    WEAK_SELF;
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
    
    _selectedTitleColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull selectedColor) {
        weakSelf.component.selectedTitleColr = selectedColor;
        return weakSelf;
    };
    
    _normalTitleColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull normalColor) {
        weakSelf.component.normalTitleColr = normalColor;
        return weakSelf;
    };
    
    _barBackgroundColor = ^CICTabbarControllerConstructor * _Nonnull(UIColor * _Nonnull color) {
        weakSelf.component.tabBar.backgroundImage = [UIImage cic_imageWithColor:color imageSize:CGSizeMake(CIC_SCREEN_WIDTH, 1)];
        return weakSelf;
    };
    
    _barBackgroundImage = ^CICTabbarControllerConstructor * _Nonnull(id _Nonnull backgroundImage) {
        weakSelf.component.barBackgroundImage = backgroundImage;
        return weakSelf;
    };
    
    _badgeValue = ^CICTabbarControllerConstructor * _Nonnull(NSUInteger index, NSString *value) {
        if (![NSArray cic_isEmpty:weakSelf.component.childViewControllers] && weakSelf.component.childViewControllers.count > index) {
            weakSelf.component.childViewControllers[index].tabBarItem.badgeValue = value;
        }
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
    
    _selectedImageSize = ^CICTabbarControllerConstructor *(CGSize size) {
        weakSelf.component.selectedImageSize = size;
        return weakSelf;
    };
    
    _normalImageSize = ^CICTabbarControllerConstructor *(CGSize size) {
        weakSelf.component.normalImageSize = size;
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
