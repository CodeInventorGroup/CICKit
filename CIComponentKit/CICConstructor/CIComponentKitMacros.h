//
//  CIComponentKitMacros.h
//  Demo
//
//  Created by ManoBoo on 12/09/2017.
//  Copyright © 2017 ManoBoo. All rights reserved.
//

#ifndef CIComponentKitMacros_h
#define CIComponentKitMacros_h



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



/// 例子: UILabel(Constructor) 实现ci属性扩展
#define CIUIExtension(class, constructor)        \
        @interface class (Constructor)           \
        - (constructor *)ci;                     \
        @end                                     \

#define CIUIImplementation(class, constructor)                          \
    @implementation class (Constructor)                                 \
        - (constructor *)ci {                                           \
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


#endif /* CIComponentKitMacros_h */
