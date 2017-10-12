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

CICConstructorBasicProperties(CICSegmentViewConstructor)

CICConstructorProperty(CICSegmentViewConstructor, items, NSArray *items)

CICConstructorProperty(CICSegmentViewConstructor, font, UIFont *font)

CICConstructorProperty(CICSegmentViewConstructor, normalTextColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedTextColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, normalColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedColor, UIColor *color)

CICConstructorProperty(CICSegmentViewConstructor, selectedIndex, NSInteger selectedIndex)

@end


@interface CICSegmentView : UIView

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
/// 未选中模块背景色
@property (nonatomic, strong) UIColor *normalColor;
/// 选中模块背景色
@property (nonatomic, strong) UIColor *selectedColor;
/// 设置items之前必须先设置基本属性
@property (nonatomic, strong) NSArray *items;
/// 最后设置selectedIndex
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, copy) void(^selectedItemBlock)(NSInteger index);

- (CICSegmentViewConstructor *)cic;

@end
