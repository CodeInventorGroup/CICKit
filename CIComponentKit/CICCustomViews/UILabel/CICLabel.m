//
//  CICLabel.m
//  CIComponentKit
//
//  Created by ManoBoo on 15/09/2017.
//  Copyright © 2017 codeinventor. All rights reserved.
//

#import "CICLabel.h"



@interface CICLabel ()

@property (nonatomic, strong) UIColor *tempBackgroundColor;

@property (nonatomic, strong) UILongPressGestureRecognizer *longGesture;

@end

@implementation CICLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentEdgeInset = UIEdgeInsetsZero;
        self.longPress = CICLabelLongPressNone;
        self.highlightedBackgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CICLabelConstructor *)cic {
    return [[CICLabelConstructor alloc] initWithComponent:self];
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _contentEdgeInset)];
}

- (BOOL)canBecomeFirstResponder {
    return (_longPress == CICLabelLongPressCopy);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (_longPress == CICLabelLongPressCopy) {
        return (action == @selector(copyEvent));
    }
    
    return FALSE;
}

- (void)setContentEdgeInset:(UIEdgeInsets)contentEdgeInset {
    _contentEdgeInset = contentEdgeInset;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    if (NotEmptyString(text)) {
        _copyRange = NSMakeRange(0, text.length);
    }
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    if (NotEmptyString(attributedText)) {
        _copyRange = NSMakeRange(0, attributedText.length);
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? _highlightedBackgroundColor : _tempBackgroundColor;
}

- (UILongPressGestureRecognizer *)longGesture {
    if (!_longGesture) {
        _longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressEvent:)];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMenuHideEvent:) name:UIMenuControllerWillHideMenuNotification object:nil];
        [self addGestureRecognizer:_longGesture];
    }
    return _longGesture;
}

- (void)setLongPress:(CICLabelLongPress)longPress {
    _longPress = longPress;
    
    self.userInteractionEnabled = (_longPress == CICLabelLongPressCopy);
    self.longGesture.enabled = (_longPress == CICLabelLongPressCopy);
}

//MARK: - Event

- (void)copyEvent {
    if (NotEmptyString(self.attributedText)) {
        NSString *result = [[self.attributedText attributedSubstringFromRange:_copyRange] string];
        [[UIPasteboard generalPasteboard] setString:result];
    }else if (NotEmptyString(self.text)){
        NSString *result = [self.text substringWithRange:_copyRange];
        [[UIPasteboard generalPasteboard] setString:result];
    }else {
        return;
    }
}

- (void)handleLongPressEvent: (UILongPressGestureRecognizer *)gesture {
    if (_longPress != CICLabelLongPressCopy) {
        return;
    }
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        menuController.menuItems = @[[[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyEvent)]];
        [menuController setTargetRect:self.frame inView:self.superview];
        [menuController setMenuVisible:YES animated:YES];
        
        _tempBackgroundColor = self.backgroundColor;
        self.highlighted = YES;
    }
}

- (void)handleMenuHideEvent:(NSNotification *)notification {
    if (_longPress == CICLabelLongPressCopy || self.isHighlighted == NO) {
        return;
    }
    self.highlighted = NO;
}

@end



@interface CICLabelConstructor ()

@property (nonatomic, weak) CICLabel *component;

@end

@implementation CICLabelConstructor

@dynamic component;
@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;
@dynamic centerX;
@dynamic centerY;
@dynamic center;
@dynamic size;
@dynamic frame;
@dynamic backgroundColor;

@dynamic line;
@dynamic text;
@dynamic textColor;
@dynamic textAlignment;


- (void)buildConstructor {
    [super buildConstructor];
    
    __weak typeof(&*self) weakSelf = self;
    
    _contentEdgeInset = ^CICLabelConstructor *(UIEdgeInsets insets) {
        weakSelf.component.contentEdgeInset = insets;
        return weakSelf;
    };
    
    _longPress = ^CICLabelConstructor *(CICLabelLongPress longpress) {
        weakSelf.component.longPress = longpress;
        return weakSelf;
    };
    
    _copyRange = ^CICLabelConstructor *(NSRange range) {
        weakSelf.component.copyRange = range;
        return weakSelf;
    };
    
    _highlightedBackgroundColor = ^CICLabelConstructor *(UIColor *color) {
        weakSelf.component.highlightedBackgroundColor = color;
        return weakSelf;
    };
}
@end

