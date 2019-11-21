//
//  NSObject+CICCheck.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/21.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "NSObject+CICCheck.h"
#import "NSString+CICBaseProperty.h"

@implementation NSObject (CICCheck)

/// 验证image参数是否有效
+ (BOOL)cic_isValid:(id)image {
    
    BOOL result = NO;
    if (image != nil && ![image isEqual:[NSNull null]]) {
        if ([image isKindOfClass:[NSString class]] && ![NSString cic_isEmpty:image]) {
            result = YES;
        }else if ([image isKindOfClass:[NSData class]]) {
            NSData *imageData = (NSData *)image;
            result = imageData.length > 0;
        }else if ([image isKindOfClass:[UIImage class]]) {
            UIImage *showImage = (UIImage *)image;
            result = showImage.size.height > 0 && showImage.size.width > 0;
        }
    }
    
    return result;
}

@end
