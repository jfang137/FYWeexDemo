//
//  UIView+FYUtils.m
//  FYTools
//
//  Created by 方懿 on 2017/12/1.
//

#import "UIView+FYUtils.h"

@implementation UIView (FYUtils)

- (CGFloat)fy_originX
{
    return self.frame.origin.x;
}

- (void)setFy_originX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
    return;
}

- (CGFloat)fy_originY
{
    return self.frame.origin.y;
}

- (void)setFy_originY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
    return;
}

- (CGFloat)fy_rightX
{
    return [self fy_originX] + [self fy_width];
}

- (void)setFy_rightX:(CGFloat)rightX
{
    CGRect frame = self.frame;
    frame.origin.x = rightX - [self fy_width];
    self.frame = frame;
    return;
}

- (CGFloat)fy_bottomY
{
    return [self fy_originY] + [self fy_height];
}

- (void)setFy_bottomY:(CGFloat)bottomY
{
    CGRect frame = self.frame;
    frame.origin.y = bottomY - [self fy_height];
    self.frame = frame;
    return;
}

- (CGFloat)fy_centerX
{
    return self.center.x;
}

- (void)setFy_centerX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
    return;
}

- (CGFloat)fy_centerY
{
    return self.center.y;
}

- (void)setFy_centerY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
    return;
}

- (CGFloat)fy_width
{
    return self.frame.size.width;
}

- (void)setFy_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    return;
}

- (CGFloat)fy_height
{
    return self.frame.size.height;
}

- (void)setFy_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    return;
}

- (CGPoint)fy_origin
{
    return self.frame.origin;
}

- (void)setFy_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    return;
}

- (CGSize)fy_size
{
    return self.frame.size;
}

- (void)setFy_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    return;
}

@end

