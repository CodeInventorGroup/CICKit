//  CICDemoViewController.m
//  CIComponentKitDemo
//
//  Created by ManoBoo on 2017/9/18.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICDemoViewController.h"
#import <CIComponentKit.h>
#import "CICFirstViewController.h"

static NSString *const kCellIdentifier = @"CICDemoViewControllerCellIdentifier";

@interface CICDemoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *demoLists;

@end

@implementation CICDemoViewController

#pragma mark - Life Cycles
- (instancetype)init {
    
    if (self = [super init]) {
        self.title = @"Demo";
        self.demoLists = @[
            @"TabBarController",
            @"Button",
            @"Label",
        ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Actions
- (void)showTabBarController {
    
    CICTabbarController *tabBarController = [[CICTabbarController alloc] init];
    
    CICTabBarItem *firstItem = [[CICTabBarItem alloc] init];
    firstItem.cic
    .title(@"首页")
    .normalImage(@"home_tabbar_icon")
    .controllerClassName(@"CICFirstViewController")
    .selectedTitleColor([UIColor cic_hexColor:0x1296db]);
    
    CICTabBarItem *secondItem = [CICTabBarItem cic_tabBarItemNoTitleWithNormalImage:@"center_tabbar_icon" controllerClassName:@"CICSecondViewController"];
    secondItem.cic
    .normalImageSize(CGSizeMake(20, 20))
    .selectedImageSize(CGSizeMake(30, 30));
    
    CICTabBarItem *thirdItem = [CICTabBarItem cic_tabBarItemWithTitle:@"工具" normalImage:@"tool_tabbar_icon" selectedImage:@"message" controllerClassName:@"CICThirdViewController"];
    thirdItem.cic.isShowTitleWhenSelected(NO);
    
    tabBarController.cic
    .tabBarItemData(@[firstItem, secondItem, thirdItem])
    .titleImageMiddleMargin(4)
    .selectedTitleColor([UIColor systemPurpleColor]);
    
    tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tabBarController animated:YES];}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.demoLists[indexPath.row];
    return cell;
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    if ([title containsString:@"TabBarController"]) {
        [self showTabBarController];
    }else {
        Class class = NSClassFromString([NSString stringWithFormat:@"CIC%@DemoViewController",title]);
        UIViewController *viewController = [[class alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.title = title;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - Lazy Load
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CIC_SCREEN_WIDTH, CIC_SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

@end
