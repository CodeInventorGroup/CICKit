//
//  CICNumberKeyboardView.m
//  CIComponentKit
//
//  Created by NEWWORLD on 2019/4/10.
//  Copyright © 2019 codeinventor. All rights reserved.
//  自定义数字键盘
//

#import "CICNumberKeyboardView.h"
#import "UIColor+CIComponentKit.h"
#import "UIView+CICSeparatorLine.h"

static NSString *const kEmptyNumber = @"10";
static NSString *const kDeleteNumber = @"12";

/// 数字键盘 按钮个数
static NSString *const kNumberKeyboardMaxNumber = @"12";
/// 数字键盘 显示数字 个数0-9
static NSString *const kMaxNumber = @"10";

static NSString *const kKeyboardButtonTagMargin = @"360";
/// 每行键盘个数 3个
static NSString *const kPerLineNumber = @"3";
/// 键盘 4行
static NSString *const kLineNumber = @"4";

@interface CICNumberKeyboardView ()

@property (nonatomic, copy) NSArray *numberArray;
/// 数字是否是随机排列
@property (nonatomic, assign) BOOL isRandom;
/// 键盘数字
@property (nonatomic, strong) NSMutableArray *numberData;

@end

@implementation CICNumberKeyboardView

+ (CICNumberKeyboardView *)keyboardViewWithType:(CICKeyboardType)keyboardType {
    
    return [CICNumberKeyboardView keyboardViewWithType:keyboardType keyboardHeight:200];
}

+ (CICNumberKeyboardView *)keyboardViewWithType:(CICKeyboardType)keyboardType keyboardHeight:(CGFloat)keyboardHeight {
    
    CICNumberKeyboardView *keyboardView = [[CICNumberKeyboardView alloc] initWithFrame:CGRectMake(0, CIC_SCREEN_HEIGHT, CIC_SCREEN_WIDTH, keyboardHeight)];
    [keyboardView initNumberDataWithKeyboardType:keyboardType];
    [keyboardView buildNumberView];
    return keyboardView;
}

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.isRandom = NO;
        self.numberArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0",nil];
        self.numberData = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Build View
- (void)buildNumberView {
    
    for (NSUInteger i = 0; i < [kNumberKeyboardMaxNumber integerValue]; i++) {
        UIButton *button = [self buildKeyboardButtonAtIndex:i];
        [self addSubview:button];
    }
}

#pragma mark - Actions
- (void)clickKeyboardButton:(UIButton *)button {
    
    NSInteger index = button.tag - [kKeyboardButtonTagMargin integerValue];
    if ([[self.numberData objectAtIndex:index] isEqualToString:kEmptyNumber]) {
        return;
    }
    
    if (self.clickKeyboardButtonBlock) {
        NSString *title = button.titleLabel.text;
        self.clickKeyboardButtonBlock(title);
    }
}

#pragma mark - Private Methods
/// 初始化数字键盘数组
- (void)initNumberDataWithKeyboardType:(CICKeyboardType)type {
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.numberArray];
    if (type == CICKeyboardTypeRandomNumber) {
        //  生成0-9不重复随机数组
        while (tempArray.count > 1) {
            NSUInteger randomIndex = arc4random() % tempArray.count;
            NSString *randomObject = [tempArray objectAtIndex:randomIndex];
            [self.numberData addObject:randomObject];
            [tempArray removeObject:randomObject];
        }
    }else {
        NSUInteger maxNumber = [kMaxNumber integerValue];
        [self.numberData addObjectsFromArray:[self.numberArray subarrayWithRange:NSMakeRange(0, maxNumber - 1)]];
    }
    
    [self.numberData addObject:kEmptyNumber];
    [self.numberData addObject:tempArray.lastObject];
    [self.numberData addObject:kDeleteNumber];
}

- (UIButton *)buildKeyboardButtonAtIndex:(NSUInteger)index {
    
    NSUInteger perLineNumber = [kPerLineNumber integerValue];
    CGFloat perKeyboardWidth = CIC_SCREEN_WIDTH / perLineNumber;
    CGFloat perKeyboardHeight = CGRectGetHeight(self.frame)/[kLineNumber integerValue];
    
    CGFloat xMargin = (index % perLineNumber) * perKeyboardWidth;
    CGFloat yMargin = (index / perLineNumber) * perKeyboardHeight;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(xMargin, yMargin, perKeyboardWidth, perKeyboardHeight)];
    button.tag = [kKeyboardButtonTagMargin integerValue] + index;
    
    NSString *title = [self.numberData objectAtIndex:index];
    if ([self.numberArray containsObject:title]) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:20];
    }else if ([title isEqualToString:kDeleteNumber]) {
        NSBundle *bundle = [NSBundle bundleForClass:self.class];
        NSString *filePath = [bundle pathForResource:@"keyboard_delete_icon" ofType:@"png" inDirectory:@"CICKit.bundle"];
        UIImage * image = [UIImage imageWithContentsOfFile:filePath];
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateHighlighted];
    }
    button.backgroundColor = [self.numberArray containsObject:title] ? [UIColor whiteColor] : [UIColor cic_hexColor:0xe2e2e2];
    [button addTarget:self action:@selector(clickKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (index % perLineNumber != 0) {
        [button cic_addLeftSeparatorLineView];
    }
    if (index / perLineNumber != 0) {
        [button cic_addTopSeparatorLineView];
    }
    
    return button;
}

@end
