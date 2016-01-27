//
//  ViewController.m
//  GroupImage
//
//  Created by liangpingxian on 16/1/25.
//  Copyright © 2016年 liangpingxian. All rights reserved.
//

#import "ViewController.h"
#import "GroupView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat y = 50;
    CGFloat x = 0;
    
    for (int i = 0; i<= 14; i++) {
        x = (i % 3) * 110 + 10;
        y = (i / 3) * 110 + 50;
        
        GroupView *imageView = [[GroupView alloc] initWithFrame:CGRectMake(x, y, 100, 100)];
        [imageView caculateWithN:i + 1];
        [self.view addSubview:imageView];
        
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}











@end
