//
//  CICAppDelegate.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICAppDelegate.h"
#import "CICTabbarController.h"
#import "UIColor+CIComponentKit.h"

@interface CICAppDelegate ()

@end

@implementation CICAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
//    [self showTabbarController];
    [self showNoTitleTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Private Methods
- (void)showTabbarController {
    
    CICTabbarController *tabbarController = [[CICTabbarController alloc] init];
    
    NSMutableArray *tabBarItemData = [NSMutableArray array];
    CICTabBarItem *homeTabBarItem = [[CICTabBarItem alloc] init];
    homeTabBarItem.cic
    .title(@"首页")
    .normalImage(@"home_tabbar_icon")
    .controllerClassName(@"CICRootViewController")
    .isShowTitle(NO);
    [tabBarItemData addObject:homeTabBarItem];
        
    CICTabBarItem *classifyTabBarItem = [[CICTabBarItem alloc] init];
    classifyTabBarItem.cic
    .title(@"畅聊")
    .normalImage(@"message")
    .controllerClassName(@"CICSecondViewController")
    .isShowTitle(NO)
    .isShowTitleWhenSelected(NO);
    [tabBarItemData addObject:classifyTabBarItem];
    
    CICTabBarItem *thirdTabBarItem = [[CICTabBarItem alloc] init];
    thirdTabBarItem.cic
    .title(@"工具")
    .normalImageSize(CGSizeMake(30, 30))
    .selectedImageSize(CGSizeMake(20, 20))
    .normalImage(@"tool_tabbar_icon")
    .controllerClassName(@"CICThirdViewController");
    [tabBarItemData addObject:thirdTabBarItem];
    
    tabbarController.cic
    .titleImageMiddleMargin(5)
    .normalImageSize(CGSizeMake(30, 30))
    .tabBarItemData(tabBarItemData)
    .selectedTitleColor([UIColor cic_hexColor:0x1296db])
    .normalTitleColor([UIColor cic_hexColor:0x646464])
    .didSelectViewControllerBlock(^(NSInteger index) {

    });
    
    self.window.rootViewController = tabbarController;
    tabbarController.cic.badgeValue(2, @"100");
}

- (void)showNoTitleTabBarController {
    
    NSArray *items = [NSArray arrayWithObjects:
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"home_tabbar_icon" controllerClassName:@"CICRootViewController"],
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"message" controllerClassName:@"CICSecondViewController"],
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"tool_tabbar_icon" controllerClassName:@"CICThirdViewController"], nil];

    CICTabbarController *tabbarController = [[CICTabbarController alloc] init];
    tabbarController.cic
    .tabBarItemData(items)
    .normalImageSize(CGSizeMake(26, 26))    //  默认根据图片大小展示
    .selectedImageSize(CGSizeMake(26, 26))
    .didSelectViewControllerBlock(^(NSInteger index) {

    });

    self.window.rootViewController = tabbarController;
}

@end
