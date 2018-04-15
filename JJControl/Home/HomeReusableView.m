//
//  HomeReusableView.m
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeReusableView.h"
@interface HomeReusableView()
{
    UISegmentedControl *segmentCtrl;
    
}


@end
@implementation HomeReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *tmpiconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:tmpiconView];
        self.iconView=tmpiconView;
        
       
        
        
        segmentCtrl = [[UISegmentedControl alloc]initWithFrame:CGRectZero];
        [self addSubview:segmentCtrl];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
        [segmentCtrl setTitleTextAttributes:dic forState:UIControlStateSelected];
        [segmentCtrl setBackgroundColor:[UIColor whiteColor]];
        [segmentCtrl insertSegmentWithTitle:@"设备" atIndex:1 animated:NO];
        [segmentCtrl insertSegmentWithTitle:@"场景" atIndex:2 animated:NO];
        [segmentCtrl insertSegmentWithTitle:@"联动" atIndex:3 animated:NO];
        [segmentCtrl setTintColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
        [segmentCtrl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
        [segmentCtrl setSelectedSegmentIndex:0];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"JJControlResource.bundle/add_scene.png"] forState:UIControlStateNormal];
        self.btnAction=btn;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _iconView.frame = self.bounds;//CGRectMake(14, CGRectGetMaxY(imgView.frame)+5, frame.size.width-28, 34)
    segmentCtrl.frame=CGRectMake(14, CGRectGetMaxY(_iconView.frame)-34, self.frame.size.width-28, 34);
    [_btnAction mas_makeConstraints:^(MASConstraintMaker *make) { 
        make.right.mas_equalTo(_iconView).offset(-20);
        make.top.mas_equalTo(_iconView).offset(20);
        make.width.mas_equalTo(@34);
        make.height.mas_equalTo(@34);
    }];
    
    
}

-(void)change:(UISegmentedControl *)sender{
    
    if (sender.selectedSegmentIndex==0) {
        [self.btnAction setImage:[UIImage imageNamed:@"JJControlResource.bundle/add_scene.png"] forState:UIControlStateNormal];
    }else if (sender.selectedSegmentIndex==1) {
        [self.btnAction setImage:[UIImage imageNamed:@"JJControlResource.bundle/add_device.png"] forState:UIControlStateNormal];
    }else{
        [self.btnAction setImage:[UIImage imageNamed:@"JJControlResource.bundle/add_linkage.png"] forState:UIControlStateNormal];
        
    }
    if (_segmentChangedBlock) {
        _segmentChangedBlock(sender.selectedSegmentIndex);
    }
}

-(void)add:(id *)sender{
    if (_addBlock) {
        _addBlock(segmentCtrl.selectedSegmentIndex);
    }
}
@end
