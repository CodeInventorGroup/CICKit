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

typedef enum : NSUInteger {
    CICSeparatorLinePositionTop = 0,
    CICSeparatorLinePositionLeft,
    CICSeparatorLinePositionBottom,
    CICSeparatorLinePositionRight
}CICSeparatorLinePosition;

@interface UIView (CICSeparatorLine)

+ (instancetype)cic_separatorLineWithFrame:(CGRect)frame;
- (instancetype)cic_addTopSeparatorLineView;
- (instancetype)cic_addLeftSeparatorLineView;
- (instancetype)cic_addBottomSeparatorLineView;
- (instancetype)cic_addRightSeparatorLineView;

- (instancetype)cic_addSeparatorLineViewWithPosition:(CICSeparatorLinePosition)position;
- (instancetype)cic_addSeparatorLineViewWithPosition:(CICSeparatorLinePosition)position lineColor:(UIColor *)lineColor;

@end

NS_ASSUME_NONNULL_END
