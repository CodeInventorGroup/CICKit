//
//  CICSegmentView.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/23.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

@interface CICSegmentViewConstructor<CICSegmentView> : CICUIViewConstructor

CICConstructorProperty(CICSegmentViewConstructor, items, NSArray *items)

CICConstructorProperty(CICSegmentViewConstructor, font, UIFont *font)

CICConstructorProperty(CICSegmentViewConstructor, normalTextColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedTextColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, normalColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedIndex, NSInteger selectedIndex)

CICConstructorProperty(CICSegmentViewConstructor, addTarget, id target, SEL action)

@end


@interface CICSegmentView : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, assign) NSInteger cornerRadius;
@property (nonatomic, assign) NSInteger selectedIndex;

- (CICSegmentViewConstructor *)cic;

@end
