//
//  NSBundle+CICLibraray.h
//  CICKit
//
//  Created by NEWWORLD on 2019/4/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (CICLibraray)

+ (NSBundle *)cic_localLibrayBundle;
+ (NSURL *)cic_localLibraryBundleURL;

@end

NS_ASSUME_NONNULL_END
