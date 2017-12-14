//
//  MyImgLoderHandler.m
//  JiaKaoBaoDian_pods
//
//  Created by 方懿 on 2017/11/29.
//  Copyright © 2017年 木仓科技. All rights reserved.
//

#import "MyImgLoderHandler.h"

@implementation MyImgLoderHandler

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock {
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    
    if (completedBlock) {
        completedBlock(image,nil,YES);
    }
    return self;
}

- (void)cancel {
    //如果控制图片下载过程，可以在错误的时候canle掉
}

@end

