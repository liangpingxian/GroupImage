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
    
    GroupView *imageView11 = [[GroupView alloc] initWithFrame:CGRectMake(10, y, 100, 100)];
    [imageView11 caculateWithN:1];
    [self.view addSubview:imageView11];
    
    GroupView *imageView12 = [[GroupView alloc] initWithFrame:CGRectMake(130, y, 100, 100)];
    
    [imageView12 caculateWithN:2];
    [self.view addSubview:imageView12];
    
    
    GroupView *imageView13 = [[GroupView alloc] initWithFrame:CGRectMake(250, y, 100, 100)];
    [imageView13 caculateWithN:3];
    [self.view addSubview:imageView13];
    
    y += 110;
    
    GroupView *imageView14 = [[GroupView alloc] initWithFrame:CGRectMake(10, y, 100, 100)];
    
    [imageView14 caculateWithN:4];
    [self.view addSubview:imageView14];
    GroupView *imageView16 = [[GroupView alloc] initWithFrame:CGRectMake(130, y, 100, 100)];
    
    [imageView16 caculateWithN:5];
    [self.view addSubview:imageView16];
    
    GroupView *imageView17 = [[GroupView alloc] initWithFrame:CGRectMake(250, y, 100, 100)];
    
    
    y += 110;
    
    [imageView17 caculateWithN:6];
    [self.view addSubview:imageView17];
    
    GroupView *imageView123 = [[GroupView alloc] initWithFrame:CGRectMake(10, y, 100, 100)];
    
    [imageView123 caculateWithN:7];
    [self.view addSubview:imageView123];
    
    GroupView *imageView18 = [[GroupView alloc] initWithFrame:CGRectMake(130, y, 100, 100)];
    
    [imageView18 caculateWithN:8];
    [self.view addSubview:imageView18];
    
    GroupView *imageView111 = [[GroupView alloc] initWithFrame:CGRectMake(250, y, 100, 100)];
    
    [imageView111 caculateWithN:9];
    [self.view addSubview:imageView111];
    
    y += 110;
    
    
    GroupView *imageView19 = [[GroupView alloc] initWithFrame:CGRectMake(10, y, 100, 100)];
    
    [imageView19 caculateWithN:10];
    [self.view addSubview:imageView19];
    
    GroupView *imageView110 = [[GroupView alloc] initWithFrame:CGRectMake(130, y, 100, 100)];
    
    [imageView110 caculateWithN:11];
    [self.view addSubview:imageView110];
    
    GroupView *imageView1111 = [[GroupView alloc] initWithFrame:CGRectMake(250, y, 100, 100)];
    
    [imageView1111 caculateWithN:12];
    [self.view addSubview:imageView1111];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}











@end
