//
//  UIImage+CICSize.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CICSize)

/// 对图片尺寸进行压缩--
+ (UIImage *)cic_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

/// 对图片尺寸进行压缩
- (UIImage *)cic_imageScaleToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
