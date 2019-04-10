//
//  CICSecondViewController.m
//  CIComponentKitDemo
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICSecondViewController.h"

#import "CICVerifyPayPasswordView.h"

@interface CICSecondViewController ()

@end

@implementation CICSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self buildView];
}

#pragma mark - ViewModel LoadData
- (void)verifyPayPassword {
    
    NSLog(@"verifyPayPassword 验证支付密码");
}


#pragma mark - Build View
- (void)buildView {
    
    __weak typeof(self) weakSelf = self;
    CICVerifyPayPasswordView *verifyPayPasswordView = [CICVerifyPayPasswordView verifyPayPasswordViewWithFrame:self.view.bounds verifyPayPasswordBlock:^(NSString * _Nonnull password) {
        [weakSelf verifyPayPassword];
    }];
    [self.view addSubview:verifyPayPasswordView];
}

#pragma mark - Actions
/// 取消支付
- (void)cancelPay {
    
    
}

@end
