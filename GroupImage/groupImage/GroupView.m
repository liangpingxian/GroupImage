//
//  GroupView.m
//  Kurrent
//
//  Created by liangpingxian on 16/1/23.
//  Copyright © 2016年 Kurrent. All rights reserved.
//

#import "GroupView.h"
#import "UIImage+Additions.h"

static inline float radians(double degrees) { return degrees * M_PI / 180; }
#define angle 60


@implementation GroupView


///n个头像
- (void)caculateWithN:(NSInteger)n
{
    
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = .5;
    
    CGFloat viewWidth = 100;
    
    ///内角
    CGFloat k = (n-2) * M_PI / n;
    
    //2r *cos(a/2) =  多边形边长
    //多边形边长 * sin((n / 2) * ((pi/2)-(k/2)))/(cos(k/2)) = 最长对角线 距离
    //最长对角线 距离  + 2r =  正方形边长
    //头像的半径
    
    
    //最长对角线  取点的 规则
    NSInteger dian = n / 2 - (n %4 == 0 ? 1 :0);
    //    NSInteger dian = n / 2;
    
    //小圆半径
    CGFloat rad = viewWidth / (2 + 2 * cos(radians(angle / 2)) * sin(dian * ((M_PI/2)-(k/2)))/(cos(k/2)));
    
    //    //最长对角线
    //    CGFloat longestLine = 2 * rad * cos(radians(angle / 2)) * sin(dian * ((M_PI/2)-(k/2)))/(cos(k/2));
    //大圆半径
    CGFloat bRad = rad *cos(radians(angle/2)) / sin (M_PI /n);
    
    //偏移量
    CGFloat detaY = n % 2 == 0 ? 0 : ((viewWidth - (bRad * cos(M_PI /n) + bRad) - 2 * rad) / 2);
    
    
    //大圆圆心位置
    CGFloat centerX = viewWidth / 2;
    CGFloat centerY = detaY + bRad + rad;
    
    
    if(n % 4 == 0){
        centerX = viewWidth / 2;
        centerY = viewWidth / 2;
    }
    
    //第一个头像圆心位置
    CGFloat preCenterX = viewWidth / 2;
    CGFloat preCenterY = detaY + rad;
    
    if(n != 1){
        preCenterX = centerX + bRad * cos(((n - 1) / 2.0 * 2 * M_PI / n - M_PI / 2));
        preCenterY = centerY + bRad * sin((n - 1) / 2.0 * 2 * M_PI / n - M_PI / 2);
    }
    
    
    CGPoint center = CGPointMake(preCenterX, preCenterY);
    
    [self imageViewWithIndex:0 radious:rad center:center totalCount:n];
    
    
    for (int i = 0; i <= n - 2; i ++) {
        
        preCenterX += 2 *rad *cos(radians(angle/2)) * cos( - (2*M_PI / n) * (i + 1));
        preCenterY += 2 *rad *cos(radians(angle/2)) * sin(- (2*M_PI / n) * (i + 1));
        
        center = CGPointMake(preCenterX, preCenterY);
        [self imageViewWithIndex:i + 1 radious:rad center:center totalCount:n];
        
        
    }

    
    
    
}


- (void)imageViewWithIndex:(NSInteger)index
                   radious:(CGFloat)rad
                    center:(CGPoint)center
                totalCount:(NSInteger)totalCount
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(center.x - rad,center.y - rad, 2 *rad, 2 *rad)];
    imageView.layer.cornerRadius = rad;
    imageView.tag = index + 1;
    imageView.image = [[UIImage imageWithString:[NSString stringWithFormat:@"%ld",index] width:100] circleImageWithSmallInsert];
    [self addSubview:imageView];
    
    if(totalCount > 2 && index == totalCount - 1){
        
        imageView.image = [imageView.image cuttingImageRightWithAngle:angle/2];
        
    }
    
}




@end
