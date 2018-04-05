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
    UISegmentedControl *segmentCtrl = [[UISegmentedControl alloc]init];
    segmentCtrl.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:segmentCtrl];
    
    [segmentCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(14);
        make.right.mas_equalTo(self).offset(-14);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
    
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
