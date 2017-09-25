//
//  CICRootViewController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/12.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICRootViewController.h"
#import "CIComponentKit.h"

#import "CICDemoViewController.h"

@interface CICRootViewController ()

@end

@implementation CICRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CICLabel *label = [CICLabel new];
    label.cic
        .text(@"welcome to cicomponent😄")
        .textColor([UIColor blackColor])
        .frame(CGRectMake(0, 164, self.view.bounds.size.width, 44))
        .textAlignment(NSTextAlignmentCenter)
        .backgroundColor([UIColor greenColor])
        .contentEdgeInset(UIEdgeInsetsMake(0, 10, 0, -10))
        .copyRange(NSMakeRange(0, 10))
        .longPress(CICLabelLongPressCopy)
        .highlightedBackgroundColor([UIColor lightGrayColor]);
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    CICDemoViewController *vc = [CICDemoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
