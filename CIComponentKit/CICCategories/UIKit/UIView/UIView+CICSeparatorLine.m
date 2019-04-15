//
//  UIView+CICSeparatorLine.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  分割线
//

#import "UIView+CICSeparatorLine.h"
#import "CICColorMacros.h"
#import "CICSizeMacros.h"

@implementation UIView (CICSeparatorLine)

+ (instancetype)cic_separatorLineWithFrame:(CGRect)frame {
    UIView *separatorLine = [[UIView alloc] initWithFrame:frame];
    separatorLine.backgroundColor = CIC_COLOR_SEPARATOR_LINE;
    return separatorLine;
}


- (instancetype)cic_addTopSeparatorLineView {
    CGSize size = self.bounds.size;
    CGRect lineFrame = CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, size.width, CIC_SEPARATOR_LINE_SIZE);
    UIView *line = [self.class cic_separatorLineWithFrame:lineFrame];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:line];
    return line;
}
- (instancetype)cic_addLeftSeparatorLineView {
    CGSize size = self.bounds.size;
    CGRect lineFrame = CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, CIC_SEPARATOR_LINE_SIZE, size.height);
    UIView *line = [self.class cic_separatorLineWithFrame:lineFrame];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:line];
    
    return line;
}

- (instancetype)cic_addBottomSeparatorLineView {
    CGSize size = self.bounds.size;
    CGRect lineFrame = CGRectMake(ZERO_ORIGIN, size.height - CIC_SEPARATOR_LINE_SIZE, size.width, CIC_SEPARATOR_LINE_SIZE);
    UIView *line = [self.class cic_separatorLineWithFrame:lineFrame];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:line];
    
    return line;
}

- (instancetype)cic_addRightSeparatorLineView {
    CGSize size = self.bounds.size;
    CGRect lineFrame = CGRectMake(size.width, ZERO_ORIGIN, CIC_SEPARATOR_LINE_SIZE, size.height);
    UIView *line = [self.class cic_separatorLineWithFrame:lineFrame];
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:line];
    
    return line;
}

- (instancetype)cic_addSeparatorLineViewWithPosition:(CICSeparatorLinePosition)position {
    
    return [self cic_addSeparatorLineViewWithPosition:position lineColor:CIC_COLOR_SEPARATOR_LINE];
}

- (instancetype)cic_addSeparatorLineViewWithPosition:(CICSeparatorLinePosition)position lineColor:(UIColor *)lineColor {
    
    CGSize size = self.bounds.size;
    UIView *line = [[UIView alloc] init];
    CGRect lineFrame;
    switch (position) {
        case CICSeparatorLinePositionTop:
            lineFrame = CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, size.width, CIC_SEPARATOR_LINE_SIZE);
            break;
        case CICSeparatorLinePositionLeft:
            lineFrame = CGRectMake(ZERO_ORIGIN, ZERO_ORIGIN, CIC_SEPARATOR_LINE_SIZE, size.height);
            break;
        case CICSeparatorLinePositionRight:
            lineFrame = CGRectMake(size.width, ZERO_ORIGIN, CIC_SEPARATOR_LINE_SIZE, size.height);
            break;
        case CICSeparatorLinePositionBottom:
            lineFrame = CGRectMake(ZERO_ORIGIN, size.height - CIC_SEPARATOR_LINE_SIZE, size.width, CIC_SEPARATOR_LINE_SIZE);
            break;
    }
    line.frame = lineFrame;
    line.backgroundColor = lineColor;
    [self addSubview:line];
    return line;
}

@end
