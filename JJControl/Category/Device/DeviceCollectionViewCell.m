//
//  DeviceCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceCollectionViewCell.h"
#import "DeviceModel.h"

@interface DeviceCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UISwitch *_switch;
}
@end

@implementation DeviceCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(12,12, 26, 26)];
    [self addSubview:_imgView];
    
    _lbName =[[UILabel alloc]initWithFrame:CGRectMake(48, 0,200, 50)];
    [self addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    _switch =[[UISwitch alloc]initWithFrame:CGRectMake(248, 0,200, 50)];
    [self addSubview:_switch];
    
}

- (void)setData:(id)data{
    DeviceModel *model = (DeviceModel *)data;
    [_imgView setImage:[UIImage imageNamed:model.pic]];
    [_lbName setText:model.title];
    [_switch setOn:model.isOn];
}

@end

