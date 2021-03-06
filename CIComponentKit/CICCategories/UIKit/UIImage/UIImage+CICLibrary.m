//
//  UIImage+CICLibrary.m
//  CICKit
//
//  Created by NEWWORLD on 2019/4/11.
//

#import "UIImage+CICLibrary.h"
#import "NSBundle+CICLibraray.h"

@implementation UIImage (CICLibrary)

+ (UIImage *)cic_localBundleImageNamed:(NSString *)imageName {
    
    return [self cic_imageNamed:imageName inBundle:[NSBundle cic_localLibrayBundle]];
}

+ (UIImage *)cic_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}

@end
