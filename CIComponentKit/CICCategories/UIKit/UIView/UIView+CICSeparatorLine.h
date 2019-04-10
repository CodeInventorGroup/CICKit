//
//  UIView+CICSeparatorLine.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  分割线
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CICSeparatorLine)

+ (instancetype)cic_separatorLineWithFrame:(CGRect)frame;
- (instancetype)cic_addTopSeparatorLineView;
- (instancetype)cic_addLeftSeparatorLineView;
- (instancetype)cic_addBottomSeparatorLineView;
- (instancetype)cic_addRightSeparatorLineView;

@end

NS_ASSUME_NONNULL_END
