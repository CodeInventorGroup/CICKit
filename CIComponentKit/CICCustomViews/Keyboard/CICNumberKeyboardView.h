//
//  CICNumberKeyboardView.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  自定义数字键盘
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CICKeyboardTypeNumber = 0,              //  纯数字键盘0-9
    CICKeyboardTypeRandomNumber,            //  随机纯数字键盘0-9
}CICKeyboardType;

@interface CICNumberKeyboardView : UIView

+ (CICNumberKeyboardView *)keyboardViewWithType:(CICKeyboardType)keyboardType;
+ (CICNumberKeyboardView *)keyboardViewWithType:(CICKeyboardType)keyboardType keyboardHeight:(CGFloat)keyboardHeight;

/// value为空，表示删除；其他为键盘数值
@property (nonatomic, copy) void(^clickKeyboardButtonBlock)(NSString *value);

@end

NS_ASSUME_NONNULL_END
