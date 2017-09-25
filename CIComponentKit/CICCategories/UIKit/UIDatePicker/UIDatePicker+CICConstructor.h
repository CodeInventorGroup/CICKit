//
//  UIDatePicker+CICConstructor.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/19.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CICConstructor.h"

@interface CICUIDatePickerConstructor<UIDatePicker> : CICUIViewConstructor

CICConstructorProperty(CICUIDatePickerConstructor, date, NSDate *date)

@end

@interface UIDatePicker (CICConstructor)

- (CICUIDatePickerConstructor *)cic;

@end
