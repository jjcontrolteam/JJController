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
    UILabel *_lbLocate;
    UIImageView *_imgViewIcon;
    
    //两者取其一
    UIButton *_btnSwitch;
    UILabel *_lbState;
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
    
    _imgView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];
    
    _lbName =[[UILabel alloc]init];
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    _lbLocate = [[UILabel alloc]init];
    [self.contentView addSubview:_lbLocate];
    [_lbLocate setTextAlignment:NSTextAlignmentLeft];
    [_lbLocate setFont:[UIFont systemFontOfSize:16]];
    [_lbLocate setTextColor:[UIColor blackColor]];
  
    _imgViewIcon = [[UIImageView alloc]init];
    [self.contentView addSubview:_imgViewIcon];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    [_lbLocate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
   
    [_imgViewIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lbLocate.mas_bottom);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
        make.width.height.mas_equalTo(10);
    }];
    
    _btnSwitch =[[UIButton alloc]init];
    [self.contentView addSubview:_btnSwitch];
    [_btnSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
    }];
}

- (void)setData:(id)data{
    DeviceModel *model = (DeviceModel *)data;
    [_imgView setImage:[UIImage imageNamed:model.pic]];
    [_lbName setText:model.title];
    [_lbLocate setText:@"啊啊啊"];
    [_imgViewIcon setImage:[UIImage imageNamed:model.pic]];
    
    if(model.isOn){
        [_btnSwitch setTitle:@"ON" forState:UIControlStateNormal];
        [_btnSwitch setBackgroundColor:[UIColor greenColor]];
        [_btnSwitch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [_btnSwitch setTitle:@"OFF" forState:UIControlStateNormal];
        [_btnSwitch setBackgroundColor:[UIColor whiteColor]];
        [_btnSwitch setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
 
    }
}

@end

