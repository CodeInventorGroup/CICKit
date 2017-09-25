//  CICDemoViewController.m
//  CIComponentKitDemo
//
//  Created by ManoBoo on 2017/9/18.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICDemoViewController.h"

@interface CICDemoViewController ()

@property (nonatomic, strong) NSString *sssss;

@end

@implementation CICDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CICDemoViewController";

    self.name = @"ManoBoo";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];

    NSLog(@"---- %@", self.name);
    [self sssssssss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sssssssss {
    NSLog(@"sssssssssssssss");
}

@end
