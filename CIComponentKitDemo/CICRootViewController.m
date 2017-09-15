//
//  CICRootViewController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICRootViewController.h"
#import "CIComponentKit.h"


@interface CICRootViewController ()

@end

@implementation CICRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CICLabel *label = [CICLabel new];
    label.cic
        .text(@"welcome to cicomponent😄")
        .textColor([UIColor blackColor])
        .frame(CGRectMake(0, 64, self.view.bounds.size.width, 44))
        .textAlignment(NSTextAlignmentCenter)
        .backgroundColor([UIColor greenColor])
        .contentEdgeInset(UIEdgeInsetsMake(0, 10, 0, -10))
        .copyRange(NSMakeRange(0, 10));
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
