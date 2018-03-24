//
//  DeviceCollectionReusableView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceCollectionReusableView.h"

@implementation DeviceCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(14, 0, self.frame.size.width-28, 34)];
    [self addSubview:segmentCtrl];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [segmentCtrl setTitleTextAttributes:dic forState:UIControlStateSelected];
    [segmentCtrl insertSegmentWithTitle:@"设备" atIndex:0 animated:NO];
    [segmentCtrl insertSegmentWithTitle:@"场景" atIndex:1 animated:NO];
    [segmentCtrl setTintColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    [segmentCtrl setSelectedSegmentIndex:0];
    [segmentCtrl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISegmentedControl *)segment{
    if(self.segmentChangedBlock){
        self.segmentChangedBlock(segment.selectedSegmentIndex);
    }
}

@end
