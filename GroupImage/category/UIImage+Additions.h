//
//  UIImage+scale.h
//   
//
//  Created by Liangpx on 14-4-9.
//  Copyright (c) 2014年   . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)


//根据名字生成图片 底色根据名字的规则取值
+ (UIImage *)imageWithString:(NSString *)string width:(CGFloat)width;
//宽度默认 60
+ (UIImage *)imageWithString:(NSString *)string;
//根据名字生成图片 底色为灰色
+ (UIImage *)grayImageWithString:(NSString *)string width:(CGFloat)width;

///切割掉右边一部分的图片
- (UIImage *)cuttingImageRightWithAngle:(CGFloat)angle;

- (UIImage *)circleImageWithSmallInsert;

- (UIImage *)circleImageWithInsert:(CGFloat)insert;

- (UIImage *)grayImage;

@end
