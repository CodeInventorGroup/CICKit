//
//  CIRootViewController.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "CIRootViewController.h"
#import "CIComponentKit.h"

#define STATUSBAR_HEIGHT            20

@interface CIRootViewController ()



@end

@implementation CIRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *testLabel = [UILabel ci_labelWithFrame:CGRectMake(20, 100, 200, 40) textColor:[UIColor purpleColor] font:[UIFont systemFontOfSize:13] text:@"测试内容"];
    [self.view addSubview:testLabel];
    
    [testLabel ci_adjustViewFrameWithOriginX:0];
    
    UIButton *button = [UIButton ci_buttonWithFrame:CGRectMake(40, 200, 100, 40) title:@"点我啊" titleColor:[UIColor purpleColor] font:[UIFont systemFontOfSize:14] target:self action:@selector(handleTapAction)];
    [self.view addSubview:button];
    
    [button ci_adjustViewFrameWithOriginY:0];
    
    CICustomImageTitleButton *testButton = [CICustomImageTitleButton ci_customButtonWithButtonType:CICustomButtonTypeTopImageBottomTitle frame:CGRectMake(40, 200, 300, 100) title:@"测试内容" titleColor:[UIColor purpleColor] font:CI_FONT_14 imageName:@"test.jpg" backgroundColor:[UIColor whiteColor] target:self action:@selector(handleTapAction) margin:20];
    [self.view addSubview:testButton];
}

- (void)handleTapAction {

    NSLog(@"点击了一下");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
