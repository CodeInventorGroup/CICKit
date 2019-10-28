//
//  CICSecondViewController.m
//  CIComponentKitDemo
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICSecondViewController.h"
#import <CICKit/CICVerifyPayPasswordView.h>

@interface CICSecondViewController ()

@end

@implementation CICSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemPurpleColor];
//    [self buildView];
}

#pragma mark - Build View
- (void)buildView {
    
//    CGFloat width = 300;
//    CICVerifyPayPasswordView *verifyPasswordView = [CICVerifyPayPasswordView verifyPayPasswordViewWithFrame:CGRectMake((CIC_SCREEN_WIDTH - width)/2.0, 200, width, 50) verifyPayPasswordBlock:^(NSString * _Nonnull password) {
//        NSLog(@"password: %@", password);
//    }];
    
//    CICVerifyPayPasswordView *verifyPasswordView = [CICVerifyPayPasswordView verifyPayPasswordViewWithFrame:CGRectMake((CIC_SCREEN_WIDTH - width)/2.0, 200, width, 50) showKeyboardBottomHeight:CIC_TAB_BAR_HEIGHT keyboardHeight:0 keyboardType:CICKeyboardTypeRandomNumber verifyPayPasswordBlock:^(NSString * _Nonnull password) {
//
//    }];
//    [verifyPasswordView cic_addTo:self.view];
}

@end
