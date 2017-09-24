//
//  UISearchBar+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/23.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

@interface CICUISearchBarConstructor<UISearchBar>: CICUIViewConstructor

CICConstructorBasicProperties(CICUISearchBarConstructor)

CICConstructorProperty(CICUISearchBarConstructor, text, NSString *text)

CICConstructorProperty(CICUISearchBarConstructor, placeholder, NSString *placeholder)

CICConstructorProperty(CICUISearchBarConstructor, tintColor, UIColor *color)

CICConstructorProperty(CICUISearchBarConstructor, barTintColor, UIColor *color)

CICConstructorProperty(CICUISearchBarConstructor, searchBarStyle, UISearchBarStyle style)

CICConstructorProperty(CICUISearchBarConstructor, delegate, id<UISearchBarDelegate> delegate)

@end

@interface UISearchBar (CICConstructor)

- (CICUISearchBarConstructor *)cic;

@end
