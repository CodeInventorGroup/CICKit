//
//  UIDevice+CICUtils.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (CICUtils)

// iPhoneX、iPhoneXR、iPhoneXs、iPhoneXs Max等
// 判断刘海屏，返回YES表示是刘海屏
// UIView中的safeAreaInsets如果是刘海屏就会发生变化，普通屏幕safeAreaInsets恒等于UIEdgeInsetsZero
+ (BOOL)isNotchScreen;

@end

NS_ASSUME_NONNULL_END
