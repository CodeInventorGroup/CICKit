//
//  CICImageTitleButton.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "CICImageTitleButton.h"
#import "UILabel+CIText.h"
#import "UILabel+CICConstructor.h"
#import "UIImageView+CICConstructor.h"

@implementation CICImageTitleButton

    /// 自定义button实例(任意buttonType的titleLabel、imageView均居中展示)(点击事件为TapGestue)
+ (CICImageTitleButton *)cic_customButtonWithButtonType:(CICustomButtonType)buttonType
                                                      frame:(CGRect)frame
                                                      title:(NSString *)title
                                                 titleColor:(UIColor *)titleColor
                                                       font:(UIFont *)font
                                                  imageName:(NSString *)imageName
                                            backgroundColor:(UIColor *)backgroundColor
                                                     target:(id)target
                                                     action:(SEL)action
                                                     margin:(CGFloat)margin {
    
    return [CICImageTitleButton cic_customButtonWithButtonType:buttonType frame:frame title:title titleColor:titleColor font:font imageName:imageName imageViewSize:CGSizeZero backgroundColor:backgroundColor target:target action:action margin:margin];
}
    
    /// 自定义button实例(设置imageView的size大小，不根据image的大小适配)
+ (CICImageTitleButton *)cic_customButtonWithButtonType:(CICustomButtonType)buttonType
                                                      frame:(CGRect)frame
                                                      title:(NSString *)title
                                                 titleColor:(UIColor *)titleColor
                                                       font:(UIFont *)font
                                                  imageName:(NSString *)imageName
                                              imageViewSize:(CGSize)imageViewSize
                                            backgroundColor:(UIColor *)backgroundColor
                                                     target:(id)target
                                                     action:(SEL)action
                                                     margin:(CGFloat)margin {
    
    CICImageTitleButton *customButton = [[CICImageTitleButton alloc] initWithFrame:frame];
    if (backgroundColor) {
        customButton.backgroundColor = backgroundColor;
    }
    
    //  初始化titleLabel、imageView
    CGFloat titleLabelHeight = font.pointSize;
//    UILabel *titleLabel = [UILabel ci_labelWithFrame:CGRectMake(0, 0, 0, titleLabelHeight) textColor:titleColor font:font text:title];
    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.cic.frame(CGRectMake(0, 0, 0, titleLabelHeight))
    [titleLabel cic_labelSingleLineWithText:title];
    [customButton addSubview:titleLabel];
    
    UIImageView *imageView = nil;
//    UIImageView *imageView = [UIImageView ci_imageViewWithFrame:CGRectZero imageName:imageName];    
    CGSize imageSize = CGSizeEqualToSize(imageViewSize, CGSizeZero) ? [UIImage imageNamed:imageName].size : imageViewSize;
//    [imageView cic_adjustViewFrameWithWidth:imageSize.width height:imageSize.height];
    imageView.contentMode = CGSizeEqualToSize(imageViewSize, CGSizeZero) ? UIViewContentModeCenter : UIViewContentModeScaleAspectFill;
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
//            [imageView cic_adjustViewFrameWithOriginX:buttonType == CICustomButtonTypeLeftImageRightTitle ? originX : maxOriginX originY:(height - imageSize.height)/2.0];
//            [titleLabel cic_adjustViewFrameWithOriginX:buttonType == CICustomButtonTypeLeftTitleRIghtImage ? originX : maxOriginX originY:(height - titleLabelHeight)/2.0];
            break;
        }
        case CICustomButtonTypeTopImageBottomTitle:
        case CICustomButtonTypeTopTitleBottomImage: {
            
            CGFloat originY = (height - imageSize.height - margin - titleLabelHeight)/2.0;
            CGFloat maxOriginY = originY + (buttonType == CICustomButtonTypeTopImageBottomTitle ? imageSize.height : titleLabelHeight) + margin;
//            [imageView cic_adjustViewFrameWithOriginX:(width - imageSize.width)/2.0 originY:buttonType == CICustomButtonTypeTopImageBottomTitle ? originY : maxOriginY];
//            [titleLabel cic_adjustViewFrameWithOriginX:(width - CGRectGetWidth(titleLabel.frame))/2.0 originY:buttonType == CICustomButtonTypeTopTitleBottomImage ? originY : maxOriginY];
            break;
        }
    }
    
    return customButton;
}

@end
