//
//  CICRootViewController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICRootViewController.h"

#import "CICDemoViewController.h"
#import "UIColor+CIComponentKit.h"
#import "CICLabel.h"
#import "CICHUD.h"
#import <CICTabbarController.h>

@interface CICRootViewController ()

@end

@implementation CICRootViewController

#pragma mark - Life Cycles
- (void)viewDidLoad {
    [super viewDidLoad];
//    CICColorBox color = {211, 121, 124, 0.8};
//    self.view.backgroundColor = [UIColor cic_srgbColorWithBox: color];
    self.view.backgroundColor = CICColorMake(211, 121, 124, 0.8);
    
    [self.view addSubview:({
        CICLabel *label = [CICLabel new];
        label.cic
        .text(@"😄Welcome to CIComponent😄")
        .textColor([UIColor blackColor])
        .frame(CGRectMake(0, 164, self.view.bounds.size.width, 44))
        .textAlignment(NSTextAlignmentCenter)
        .backgroundColor([UIColor cic_p3RandomColor])
        .contentEdgeInset(UIEdgeInsetsMake(0, 10, 0, -10))
        .copyRange(NSMakeRange(0, 10))
        .longPress(CICLabelLongPressCopy)
        .highlightedBackgroundColor([UIColor cic_p3RandomColor]);
        label;
    })];
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"你开心就好"];
    [[CICHUD share] toasWithTitle:str];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    CICDemoViewController *vc = [CICDemoViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//}

#pragma mark - TabBarController
- (void)showTabBarControllerDemo {
    
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
    
    [self.navigationController pushViewController:tabbarController animated:YES];
}

@end
