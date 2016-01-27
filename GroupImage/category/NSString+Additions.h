//
//  NSString+Additions.h
//   
//
//  Created by xu on 5/3/14.
//  Copyright (c) 2014   . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Additions)
- (NSString *)md5_16;
- (NSString *)md5_32;

- (CGSize)textSizeWithFont:(UIFont *)font forWidth:(CGFloat)width NS_AVAILABLE_IOS(6_0);


@end
