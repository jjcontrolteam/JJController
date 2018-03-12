//
//  NavController.m
//  JJControl
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "NavController.h"
#import "GuideController.h"

@interface NavController ()
{
    UIButton *startBtn_;
}

@end

@implementation NavController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setToolbarHidden:YES];
    [self setNavigationBarHidden:YES];
    GuideController *guide = [[GuideController alloc]init];
    [self setViewControllers:@[guide]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
