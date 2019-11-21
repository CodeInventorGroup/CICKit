//  CICDemoViewController.m
//  CIComponentKitDemo
//
//  Created by ManoBoo on 2017/9/18.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICDemoViewController.h"
#import <CIComponentKit.h>

static NSString *const kCellIdentifier = @"CICDemoViewControllerCellIdentifier";

@interface CICDemoViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *demoLists;

@end

@implementation CICDemoViewController

#pragma mark - Life Cycles
- (instancetype)init {
    
    if (self = [super init]) {
        self.demoLists = @[
            @"TabBarController"
        ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: animated];
}

#pragma mark - Actions
- (void)showTabBarController {
    
    CICTabbarController *tabBarController = [[CICTabbarController alloc] init];
    
    CICTabBarItem *firstItem = [[CICTabBarItem alloc] init];
    firstItem.cic
    .title(@"首页")
    .normalImage(@"home_tabbar_icon")
    .controllerClassName(@"CICFirstViewController");
    
    tabBarController.cic
    .tabBarItemData(@[firstItem])
    .titleImageMiddleMargin(4);
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.demoLists[indexPath.row];
    return cell;
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    if ([title containsString:@"TabBarController"]) {
        [self showTabBarController];
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
