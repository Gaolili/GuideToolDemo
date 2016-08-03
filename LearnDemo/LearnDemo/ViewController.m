//
//  ViewController.m
//  LearnDemo
//
//  Created by gaolili on 16/7/29.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "LoopView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;

    LoopView * loop = [[LoopView alloc]initWithFrame:CGRectMake(0, 0, screenW, 200)];
    [self.view addSubview:loop];
    [loop starAnimation];
    
    

    
    
}
 


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
