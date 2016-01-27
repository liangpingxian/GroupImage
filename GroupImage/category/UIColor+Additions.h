//
//  UIColor.h
//   
//
//  Created by  on 14-3-10.
//  Copyright (c) 2014年   . All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (Additions)
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorFromHexCode:(NSString *)hexString;


@end