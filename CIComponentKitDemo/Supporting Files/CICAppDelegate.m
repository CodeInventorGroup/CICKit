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
    
    NSArray *items = [NSArray arrayWithObjects:
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"center_tabbar_icon" controllerClassName:@"CICRootViewController"],
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"message" controllerClassName:@"CICDemoViewController"],
                      [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"tool_tabbar_icon" controllerClassName:@"CICBaseViewController"], nil];

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
