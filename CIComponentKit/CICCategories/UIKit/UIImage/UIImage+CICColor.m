//
//  UIImage+CICColor.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/23.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import "UIImage+CICColor.h"

@implementation UIImage (CICColor)

+ (UIImage *)cic_imageWithColor:(UIColor *)color imageSize:(CGSize)imageSize {
    
    CGRect rect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
