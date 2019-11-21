//
//  CICBaseViewController.m
//  CIComponentKitDemo
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "CICBaseViewController.h"
#import <CIComponentKit.h>

@interface CICBaseViewController ()

@end

@implementation CICBaseViewController

#pragma mark - Life Cycle
- (instancetype)init {
    
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self initData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cic_p3RandomColor];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.isHiddenNavigationBar animated:YES];
}

#pragma mark - Private Methods
- (void)initData {
    
    self.isHiddenNavigationBar = NO;
}

@end
