//
//  UIView+CICDrawImage.m
//  CICKit
//
//  Created by NEWWORLD on 2020/2/28.
//  Copyright © 2020 codeinventor. All rights reserved.
//

#import "UIView+CICDrawImage.h"

@implementation UIView (CICDrawImage)

/// 绘制UIView相应的图片
- (UIImage *)cic_drawImage {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [UIScreen mainScreen].scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
