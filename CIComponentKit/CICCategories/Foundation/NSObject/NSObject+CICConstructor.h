//
//  NSObject+CICConstructor.h
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CICConstructorProtocol <NSObject>

@required
- (void)buildConstructor;

@end

@interface CICConstructor<T> : NSObject<CICConstructorProtocol>

- (instancetype)initWithComponent:(T)component;

@end

@interface NSObject (CICConstructor)

- (CICConstructor *)cic;

@end

NS_ASSUME_NONNULL_END
