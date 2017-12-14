//
//  FYUtils.h
//  FYWeexDemoIOS
//
//  Created by 方懿 on 2017/11/29.
//  Copyright © 2017年 fangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYUtils : NSObject

+ (void)performSel:(SEL)selector target:(id)target;
+ (UIColor *)rgbColor:(NSUInteger)rgbValue;
+ (UIColor *)rgbColor:(NSUInteger)rgbValue alpha:(CGFloat)alpha;

@end
