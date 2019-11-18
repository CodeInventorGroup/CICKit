//
//  NSObject+CICConstructor.m
//  CICKit
//
//  Created by NEWWORLD on 2019/11/13.
//  Copyright © 2019 codeinventor. All rights reserved.
//

#import "NSObject+CICConstructor.h"

@interface CICConstructor ()

@property (nonatomic, weak) NSObject *component;

@end

@implementation CICConstructor

- (instancetype)initWithComponent:(id)component {
    
    if (self = [super init]) {
        self.component = component;
        [self buildConstructor];
    }
    return self;
}

- (void)buildConstructor  {
    
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

@end

@implementation NSObject (CICConstructor)

- (CICConstructor *)cic {
    
    return [[CICConstructor alloc] initWithComponent:self];
}

@end
