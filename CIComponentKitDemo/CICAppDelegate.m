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
    
    [self showTabbarController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Private Methods
- (void)showTabbarController {
    
    CICTabbarController *tabbarController = [[CICTabbarController alloc] init];

    //  首先设置类名数据
    tabbarController.cic.classNameData(@[@"CICRootViewController", @"CICSecondViewController", @"CICThirdViewController"])
                        .itemDataTitleNormalImage(@[@[@"首页", @"home_tabbar_icon"],
                                                   @[@"聚中", @"center_tabbar_icon"],
                                                   @[@"工具", @"tool_tabbar_icon"]])
                        .selectedTextColor([UIColor cic_hexColor:0x1296db])
                        .normalTextColor([UIColor cic_hexColor:0x646464]);
    self.window.rootViewController = tabbarController;
    tabbarController.cic.badgeValue(2, @"100");
    
    //  动态加载tabbar图片的数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSArray *urls = [NSArray array];
//        tabbarController.cic.itemDataNormalSelectedImage(urls).barBackgroundImage(@"");
        tabbarController.cic
        .imageSize(CGSizeMake(34, 34))
        .barBackgroundColor([UIColor yellowColor])
        .itemDataTitleNormalImage(@[@[@"",@"home_tabbar_icon"],
                                    @[@"",@"center_tabbar_icon"],
                                    @[@"",@"tool_tabbar_icon"]]);
        tabbarController.didSelectedTabbarBlock = ^(NSInteger selectedIndex) {
            NSLog(@"selectedIndex = %ld", selectedIndex);
        };
    });
}


@end
