//
//  FYUtils.m
//  FYWeexDemoIOS
//
//  Created by 方懿 on 2017/11/29.
//  Copyright © 2017年 fangyi. All rights reserved.
//

#import "FYUtils.h"

@implementation FYUtils

+ (void)performSel:(SEL)selector target:(id)target {
    if (!target || !selector) return;
    if ([target respondsToSelector:selector]) {
        IMP imp = [target methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(target, selector);
    } else {
        NSLog(@"method not found : %@ target:%@",NSStringFromSelector(selector),target);
    }
}

+ (UIColor *)rgbColor:(NSUInteger)rgbValue {
    return [self rgbColor:rgbValue alpha:1.0];
}

+ (UIColor *)rgbColor:(NSUInteger)rgbValue alpha:(CGFloat)alpha {
    NSUInteger hex1 = rgbValue & 0x0000FF;
    NSUInteger hex2 = (rgbValue >> 8) & 0x0000FF;
    NSUInteger hex3 = (rgbValue >> 16) & 0x0000FF;
    return [self colorWithRedHex:hex3 greenHex:hex2 blueHex:hex1 alpha:1.0];
}

+ (UIColor *)colorWithRedHex:(NSInteger)red
                    greenHex:(NSInteger)green
                     blueHex:(NSInteger)blue
                       alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(CGFloat)red / (CGFloat)0xFF
                           green:(CGFloat)green / (CGFloat)0xFF
                            blue:(CGFloat)blue / (CGFloat)0xFF
                           alpha:alpha];
}

@end
