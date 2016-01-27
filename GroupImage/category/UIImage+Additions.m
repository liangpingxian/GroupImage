//
//  UIImage+scale.m
//   
//
//  Created by Liangpx on 14-4-9.
//  Copyright (c) 2014年   . All rights reserved.
//

#import "UIImage+Additions.h"
#import <Accelerate/Accelerate.h>
#import "NSString+Additions.h"
#import "UIColor+Additions.h"

@implementation UIImage (Additions)

+ (UIImage *)imageWithString:(NSString *)string
{
    return [self imageWithString:string width:60.0 * 3];
}

+ (UIImage *)grayImageWithString:(NSString *)string width:(CGFloat)width
{
    return [self imageWithString:string width:width * 3 withColor:[UIColor grayColor]];
}

+ (UIImage *)imageWithString:(NSString *)string width:(CGFloat)width withColor:(UIColor *)clor
{
    UIImage *image = nil;
    UIColor *color = nil;
    
    if(clor){
        color = clor;
    }else{
        
        //生成三倍图
        width *=  3;
        ///取名字的32位md5最后一位  对应的  ASCII 十进制值 的末尾值 ( 0 - 9 ) 对应的颜色为底色
        NSInteger index = (NSInteger)[[string md5_32] characterAtIndex:31];
        //取到对应的index
        index = index % 10;
        //约定的颜色值
        NSString *colorHex = @"9dce5e,fa8d66,f6a853,f7c04c,6c9cda,f59066,ec7426,6b9cdf,9bcd5e,fbbd4e";
        NSArray *colorHexArray = [colorHex componentsSeparatedByString:@","];
        //取到颜色值
        color = [UIColor colorFromHexCode:[colorHexArray objectAtIndex:index]];
    }
    
    if(string.length > 2){
        //取末两位
        string = [string substringWithRange:NSMakeRange(string.length - 2, 2)];
    }
    
    
    CGRect rect = CGRectMake(0, 0, width, width);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIColor *stringColor = [UIColor whiteColor];  //设置文本的颜色
    UIFont *font = [UIFont boldSystemFontOfSize:width / 3];
    NSDictionary* attrs =@{NSForegroundColorAttributeName:stringColor,
                           NSFontAttributeName:font,
                           };
    CGSize size = [string textSizeWithFont:font forWidth:1000];
    
    CGRect stringRect = CGRectMake((rect.size.width - size.width )/ 2, (rect.size.width - size.height) / 2, size.width, size.height);
    
    [string drawInRect:stringRect withAttributes:attrs];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
//    [[SDImageCache sharedImageCache] storeImage:image forKey:cacheString];
    
    return image;
}




+ (UIImage *)imageWithString:(NSString *)string width:(CGFloat)width
{
    
    return [self imageWithString:string width:width withColor:nil];
    
}


static inline float radians(double degrees) { return degrees * M_PI / 180; }


- (UIImage *)cuttingImageRightWithAngle:(CGFloat)angle
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //半径
    CGFloat radius = self.size.width / 2;
    
    
    CGContextAddArc(context, radius, radius, radius, radians((-angle)), radians(angle), 1);
    CGContextAddArcToPoint(context,
                           radius + (radius * sin(radians(90 - angle)) - radius * sin(radians(angle)) * tan(radians(angle))),
                           radius,
                           
                           radius + radius * sin(radians(90 - angle)),
                           radius - radius * sin(radians(angle)),
                           radius);
    
    
    CGContextClosePath(context);
    
    CGContextClip(context);
    
    
    [self drawAtPoint:CGPointMake(0, 0)];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}


- (UIImage *)circleImageWithSmallInsert
{
    return [self circleImageWithInsert:10];
}

- (UIImage *)circleImageWithInsert:(CGFloat)insert
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //半径
    CGFloat radius = self.size.width / 2;
    CGContextAddArc(context, radius, radius, radius, 0, 2 * M_PI, 1);
    CGContextClosePath(context);
    CGContextClip(context);
    
    [self drawAtPoint:CGPointMake(0, 0)];
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef contextA = UIGraphicsGetCurrentContext();
    
    
    CGContextSetFillColorWithColor(contextA, [UIColor whiteColor].CGColor);
    CGContextStrokePath(contextA);
    CGContextFillRect(contextA, CGRectMake(0, 0, radius * 2, radius * 2));
    
    
    [newimg drawInRect:CGRectMake(insert, insert, radius * 2 - 2 *insert, radius * 2 - 2 * insert)];
    
    newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    
    //半径
    CGContextAddArc(context, radius, radius, radius, 0, 2 * M_PI, 1);
    CGContextClosePath(context);
    CGContextClip(context);
    
    [newimg drawAtPoint:CGPointMake(0, 0)];
    newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    return newimg;
}



-(UIImage *)grayImage
{
    int bitmapInfo = kCGImageAlphaNone;
    int width = self.size.width;
    int height = self.size.height;
    
//    CGColorRef cgColor = [UIColor redColor].CGColor;
//    CGColorSpaceRef colorSpace = CGColorGetColorSpace(cgColor);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), self.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}




@end
