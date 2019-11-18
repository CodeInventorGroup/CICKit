//
//  NSArray+CICBaseProperty.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/18.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "NSArray+CICBaseProperty.h"

@implementation NSArray (CICBaseProperty)

+ (BOOL)cic_isEmpty:(NSArray *)array {
    
    return !array || array == NULL || array.count == 0;
}

@end
