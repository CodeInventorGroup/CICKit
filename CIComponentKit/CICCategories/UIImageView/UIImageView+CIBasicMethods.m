//
//  UIImageView+CIBasicMethods.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "UIImageView+CIBasicMethods.h"

@implementation UIImageView (CIBasicMethods)

/// imageview实例基本方法
+ (UIImageView *)ci_imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:[UIImage imageNamed:imageName]];
    return imageView;
}

//TODO: ...
- (void)cic_adjustViewFrameWithWidth:(CGFloat)width {

}

//TODO: ...
- (void)cic_adjustViewFrameWithWidth:(CGFloat)width height:(CGFloat)height {

}

//TODO: ...
- (void)cic_adjustViewFrameWithOriginX:(CGFloat)originX originY:(CGFloat)originY {

}

@end
