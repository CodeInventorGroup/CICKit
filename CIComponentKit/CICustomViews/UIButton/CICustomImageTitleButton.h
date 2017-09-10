//
//  CICustomImageTitleButton.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/10.
//  Copyright © 2017年 CodeInventor. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片、文字排列位置类型
typedef NS_ENUM(NSUInteger, CICustomButtonType) {
    ///  图片在左、标题在右
    CICustomButtonTypeLeftImageRightTitle = 0,
    ///  标题在左、图片在右
    CICustomButtonTypeLeftTitleRIghtImage,
    ///  图片在上、标题在下
    CICustomButtonTypeTopImageBottomTitle,
    ///  标题在上、图片在下
    CICustomButtonTypeTopTitleBottomImage,
};

@interface CICustomImageTitleButton : UIView

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
                                                     margin:(CGFloat)margin;

@end
