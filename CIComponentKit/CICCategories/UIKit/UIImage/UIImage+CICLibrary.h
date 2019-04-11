//
//  UIImage+CICLibrary.h
//  CICKit
//
//  Created by NEWWORLD on 2019/4/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CICLibrary)

+ (UIImage *)cic_localBundleImageNamed:(NSString *)imageName;
+ (UIImage *)cic_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
