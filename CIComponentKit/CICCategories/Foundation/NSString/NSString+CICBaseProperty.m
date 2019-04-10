//
//  NSString+CICBaseProperty.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  与String基本属性相关
//

#import "NSString+CICBaseProperty.h"

@implementation NSString (CICBaseProperty)

+ (BOOL)cic_isEmpty:(NSString *)string {
    
    return !string || string == NULL || string.length == 0;
}

@end
