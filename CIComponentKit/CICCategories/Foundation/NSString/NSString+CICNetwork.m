//
//  NSString+CICNetwork.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/9.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "NSString+CICNetwork.h"

@implementation NSString (CICNetwork)

- (BOOL)cic_isUrl {
    
    return [self containsString:@"https://"] || [self containsString:@"http://"];
}

@end
