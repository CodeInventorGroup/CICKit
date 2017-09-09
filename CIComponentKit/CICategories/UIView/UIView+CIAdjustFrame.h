//
//  UIView+CIAdjustFrame.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/9.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CIAdjustFrame)

#pragma mark - Adjust Single Position
/// 修改view的原点x
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX;
/// 修改view的原点y
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY;
/// 修改view的宽度
- (void)ci_adjustViewFrameWithWidth:(CGFloat)width;
/// 修改view的高度
- (void)ci_adjustViewFrameWithHeight:(CGFloat)height;

#pragma mark - Adjust Two Positions
/// 修改view的原点x,y
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY;
/// 修改view的原点x,width
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX width:(CGFloat)width;
/// 修改view的原点x,height
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX height:(CGFloat)height;
/// 修改view的原点y,width
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY width:(CGFloat)width;
/// 修改view的原点y,height
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY height:(CGFloat)height;
/// 修改view的width,height
- (void)ci_adjustViewFrameWithWidth:(CGFloat)width height:(CGFloat)height;

#pragma mark - Adjust Three Positions
/// 修改view的原点x,y,width
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY width:(CGFloat)width;
/// 修改view的原点x,y,height
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY height:(CGFloat)height;
/// 修改view的原点y,width,height
- (void)ci_adjustViewFrameWithOriginY:(CGFloat)originY width:(CGFloat)width height:(CGFloat)height;

#pragma mark - Adjust All Positions
/// 修改view的frame
- (void)ci_adjustViewFrameWithOriginX:(CGFloat)originX
                           originY:(CGFloat)originY
                             width:(CGFloat)width
                            height:(CGFloat)height;

@end
