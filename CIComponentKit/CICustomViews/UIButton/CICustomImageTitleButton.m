//
//  CICustomImageTitleButton.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import "CICustomImageTitleButton.h"

@implementation CICustomImageTitleButton

/// 自定义button实例(任意buttonType的titleLabel、imageView均居中展示)(点击事件为TapGestue)
+ (CICustomImageTitleButton *)ci_customButtonWithButtonType:(CICustomButtonType)buttonType
                                                      frame:(CGRect)frame
                                                      title:(NSString *)title
                                                 titleColor:(UIColor *)titleColor
                                                       font:(UIFont *)font
                                                  imageName:(NSString *)imageName
                                            backgroundColor:(UIColor *)backgroundColor
                                                     target:(id)target
                                                     action:(SEL)action
                                                     margin:(CGFloat)margin {
    
    CICustomImageTitleButton *customButton = [[CICustomImageTitleButton alloc] initWithFrame:frame];
    if (backgroundColor) {
        customButton.backgroundColor = backgroundColor;
    }
    
    //  初始化titleLabel、imageView
    CGFloat titleLabelHeight = font.pointSize;
    UILabel *titleLabel = [UILabel ci_labelWithFrame:CGRectMake(0, 0, 0, titleLabelHeight) textColor:titleColor font:font text:title];
    [titleLabel ci_labelSingleLineWithText:title];
    [customButton addSubview:titleLabel];
    
    UIImageView *imageView = [UIImageView ci_imageViewWithFrame:CGRectZero imageName:imageName];
    CGSize imageSize = [UIImage imageNamed:imageName].size;
    [imageView ci_adjustViewFrameWithWidth:imageSize.width height:imageSize.height];
    [customButton addSubview:imageView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [customButton addGestureRecognizer:tapGesture];
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    //  调整titleLabel、imageView的位置
    switch (buttonType) {
        case CICustomButtonTypeLeftImageRightTitle:
        case CICustomButtonTypeLeftTitleRIghtImage: {
            
            CGFloat originX = (width - imageSize.width - margin)/2.0;
            CGFloat maxOriginX = originX + (buttonType == CICustomButtonTypeLeftImageRightTitle ? imageSize.width : CGRectGetWidth(titleLabel.frame)) + margin;
            [imageView ci_adjustViewFrameWithOriginX:buttonType == CICustomButtonTypeLeftImageRightTitle ? originX : maxOriginX originY:(height - imageSize.height)/2.0];
            [titleLabel ci_adjustViewFrameWithOriginX:buttonType == CICustomButtonTypeLeftTitleRIghtImage ? originX : maxOriginX originY:(height - titleLabelHeight)/2.0];
            break;
        }
        case CICustomButtonTypeTopImageBottomTitle:
        case CICustomButtonTypeTopTitleBottomImage: {
            
            CGFloat originY = (height - imageSize.height - margin - titleLabelHeight)/2.0;
            CGFloat maxOriginY = originY + (buttonType == CICustomButtonTypeTopImageBottomTitle ? imageSize.height : titleLabelHeight) + margin;
            [imageView ci_adjustViewFrameWithOriginX:(width - imageSize.width)/2.0 originY:buttonType == CICustomButtonTypeTopImageBottomTitle ? originY : maxOriginY];
            [titleLabel ci_adjustViewFrameWithOriginX:(width - CGRectGetWidth(titleLabel.frame))/2.0 originY:buttonType == CICustomButtonTypeTopTitleBottomImage ? originY : maxOriginY];
            break;
        }
    }
    
    return customButton;
}

@end
