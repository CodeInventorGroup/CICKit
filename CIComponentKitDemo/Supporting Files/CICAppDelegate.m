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
    [self showNoTitleTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Private Methods
- (void)showNoTitleTabBarController {
    
//    NSArray *items = [NSArray arrayWithObjects:
//                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"center_tabbar_icon" controllerClassName:@"CICRootViewController"],
//                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"message" controllerClassName:@"CICDemoViewController"],
//                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"tool_tabbar_icon" controllerClassName:@"CICBaseViewController"], nil];
    
    NSArray *items = [NSArray arrayWithObjects:
                      [CICTabBarItem cic_tabBarItemWithTitle:@"首页" normalImage:@"center_tabbar_icon" controllerClassName:@"CICRootViewController"],
                      [CICTabBarItem cic_tabBarItemWithTitle:@"畅聊" normalImage:@"message" controllerClassName:@"CICDemoViewController"],
                      [CICTabBarItem cic_tabBarItemWithTitle:@"工具" normalImage:@"tool_tabbar_icon" controllerClassName:@"CICBaseViewController"], nil];

    CICTabbarController *tabbarController = [[CICTabbarController alloc] init];
    tabbarController.cic
    .tabBarItemData(items)
    .normalImageSize(CGSizeMake(26, 26))    //  默认根据图片大小展示
    .selectedImageSize(CGSizeMake(26, 26))
    .selectedItemIndex(1);

    self.window.rootViewController = tabbarController;
    
    if (@available(iOS 13.0, *)) {
        for (UIViewController *childViewController in tabbarController.childViewControllers) {
            // 修改设置
            UITabBarAppearance *appearance = [UITabBarAppearance new];
            // 设置未被选中的颜色
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor], NSBackgroundColorAttributeName: [UIColor redColor]};
            // 设置被选中时的颜色
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor redColor], NSBackgroundColorAttributeName: [UIColor greenColor]};
            childViewController.tabBarItem.standardAppearance = appearance;
        }
    }
}

@end
