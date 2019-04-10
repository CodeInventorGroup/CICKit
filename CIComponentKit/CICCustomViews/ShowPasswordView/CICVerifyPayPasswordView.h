//
//  CICVerifyPayPasswordView.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  自定义 输入6位密码显示框
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

@interface CICVerifyPayPasswordView : UIView

+ (CICVerifyPayPasswordView *)verifyPayPasswordViewWithFrame:(CGRect)frame
                                      verifyPayPasswordBlock:(void(^)(NSString *))verifyPayPasswordBlock;

@end

NS_ASSUME_NONNULL_END
