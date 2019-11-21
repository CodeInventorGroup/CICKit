//
//  NSObject+CICCheck.h
//  CICKit
//
//  Created by NEWWORLD on 2019/11/21.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CICCheck)

/// 验证image参数是否有效
+ (BOOL)cic_isValid:(id)image;

@end

NS_ASSUME_NONNULL_END
