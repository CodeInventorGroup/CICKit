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
    
    self.title = [[NSBundle mainBundle] bundleIdentifier];
    
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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"你开心就好"];
    [[CICHUD share] toasWithTitle:str];
    
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    CICDemoViewController *vc = [CICDemoViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//}
@end
