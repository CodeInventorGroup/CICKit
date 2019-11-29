//
//  UIViewController+CICNavigationBar.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/28.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "UIViewController+CICNavigationBar.h"

#import "UILabel+CICConstructor.h"

@implementation UIViewController (CICNavigationBar)

- (void)cic_navigationBar {
    
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)cic_navigationBarWithTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
}

@end
