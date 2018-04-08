//
//  DeviceCollectionReusableView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceCollectionReusableView.h"

@interface DeviceCollectionReusableView(){
    UISegmentedControl *_segmentCtrl;
}
@end
@implementation DeviceCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    _segmentCtrl = [[UISegmentedControl alloc]init];
    _segmentCtrl.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_segmentCtrl];
    
    [_segmentCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(14);
        make.right.mas_equalTo(self).offset(-14);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [_segmentCtrl insertSegmentWithTitle:@"" atIndex:0 animated:NO];
    [_segmentCtrl insertSegmentWithTitle:@"" atIndex:1 animated:NO];
    [_segmentCtrl setTitleTextAttributes:dic forState:UIControlStateSelected];
    [_segmentCtrl setTintColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    [_segmentCtrl setSelectedSegmentIndex:0];
    [_segmentCtrl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setCellData:(NSDictionary *)data{ 
    [_segmentCtrl setTitle:[data objectForKey:@"firstItem"]  forSegmentAtIndex:0];
    [_segmentCtrl setTitle:[data objectForKey:@"secondItem"] forSegmentAtIndex:1];
}
- (void)valueChanged:(UISegmentedControl *)segment{
    if(self.segmentChangedBlock){
        self.segmentChangedBlock(segment.selectedSegmentIndex);
    }
}



@end
