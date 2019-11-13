//
//  NSString+CICNetwork.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//  String 网络请求相关
//

#import "NSString+CICNetwork.h"

@implementation NSString (CICNetwork)

- (BOOL)cic_isUrl {
    
    return [self hasPrefix:@"https://"] || [self hasPrefix:@"http://"];
}

@end
