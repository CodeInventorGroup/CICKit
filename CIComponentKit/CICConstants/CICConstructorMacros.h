//
//  CICConstructorMacros.h
//  CIComponentKit
//
//  Created by NEWWORLD on 2017/9/14.
//  Copyright © 2017年 codeinventor. All rights reserved.
//

#ifndef CICConstructorMacros_h
#define CICConstructorMacros_h

#import <UIKit/UIkit.h>

/**
 宏定义尚声明一个属性,比如
 CICUIConstructor(CICUIViewConstructor, backgroundColor, UIColor *color)
 或者 CICUIConstructor(CICUIViewConstructor, backgroundColor, UIColor *color, Float alpha)
 @param class 类名
 @param name block名称,如 text, texctColor, font, backgroundColor等等
 @param parameters... 对应需要的参数,可以添加多个,
 @return
 */
#define CICConstructorProperty(class, name, parameters...)  @property(nonatomic, copy) class *(^name)(parameters);


/// UIView基础扩展
#define CICConstructorBasicProperties(class)                                \
CICConstructorProperty(class, x, CGFloat x)                  \
CICConstructorProperty(class, y, CGFloat y)                  \
CICConstructorProperty(class, width, CGFloat width)          \
CICConstructorProperty(class, height, CGFloat height)        \
CICConstructorProperty(class, size, CGSize size)             \
CICConstructorProperty(class, centerX, CGFloat centerX)      \
CICConstructorProperty(class, centerY, CGFloat centerY)      \
CICConstructorProperty(class, center, CGPoint center)        \
CICConstructorProperty(class, frame, CGRect frame)           \
CICConstructorProperty(class, backgroundColor, UIColor *color)      \
CICConstructorProperty(class, hidden, BOOL hidden)                  \
CICConstructorProperty(class, tag, NSInteger tag)                   \
CICConstructorProperty(class, cornerRadius, CGFloat cornerRadius)   \
CICConstructorProperty(class, masksToBounds, BOOL masksToBounds)    \
CICConstructorProperty(class, borderWidth, CGFloat borderWidth)     \
CICConstructorProperty(class, borderColor, UIColor *borderColor)    \

#define CICConstructorBasicDynamics()                            \
@dynamic x;                                                     \
@dynamic y;                                                     \
@dynamic width;                                                 \
@dynamic height;                                                \
@dynamic centerX;                                               \
@dynamic centerY;                                               \
@dynamic center;                                                \
@dynamic size;                                                  \
@dynamic frame;                                                 \
@dynamic backgroundColor;                                       \
@dynamic hidden;                                                \
@dynamic tag;                                                   \
@dynamic cornerRadius;                                          \
@dynamic masksToBounds;                                         \
@dynamic borderWidth;                                           \
@dynamic borderColor;                                           \


/// UILabel基础扩展
#define CICConstructorUILabelBasicProperties(class)                                     \
CICConstructorBasicProperties(class)                                                    \
CICConstructorProperty(class, line, NSInteger num)                                      \
CICConstructorProperty(class, textColor, UIColor *color)                                \
CICConstructorProperty(class, text, NSString *string)                                   \
CICConstructorProperty(class, textAlignment, NSTextAlignment alignment)                 \


/// 例子: UILabel(Constructor) 实现ci属性扩展
#define CIUIExtension(class, constructor)        \
@interface class (Constructor)           \
- (constructor *)cic;                     \
@end                                     \

#define CIUIImplementation(class, constructor)                          \
@implementation class (Constructor)                                 \
- (constructor *)cic {                                           \
return [[constructor alloc] initWithComponent:self];            \
}                                                               \
@end                                                                \


//MARK: CGRect便利方法

CG_INLINE CGRect
CGRectSetX(CGRect rect, CGFloat x) {
    CGRect frame = rect;
    frame.origin.x = x;
    return frame;
}

CG_INLINE CGRect
CGRectSetY(CGRect rect, CGFloat y) {
    CGRect frame = rect;
    frame.origin.y = y;
    return frame;
}

CG_INLINE CGRect
CGRectSetWidth(CGRect rect, CGFloat width) {
    CGRect frame = rect;
    frame.size.width = width;
    return frame;
}

CG_INLINE CGRect
CGRectSetHeight(CGRect rect, CGFloat height) {
    CGRect frame = rect;
    frame.size.height = height;
    return frame;
}

CG_INLINE CGRect
CGRectSetSize(CGRect rect, CGSize size) {
    return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

#endif /* CICConstructorMacros_h */
