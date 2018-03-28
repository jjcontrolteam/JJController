//
//  DeviceSettingCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingCollectionViewCell.h"

@interface DeviceSettingCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UILabel *_lbDetails;
    
}
@end

@implementation DeviceSettingCollectionViewCell

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
        make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
    }];
    
    _lbName = [[UILabel alloc]init];
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    _lbDetails = [[UILabel alloc]init];
    [self.contentView addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];
    
    UIImageView *imgArrow = [[UIImageView alloc]init];
    [self.contentView addSubview:imgArrow];
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.mas_equalTo(self.contentView.mas_height).multipliedBy(0.3);
    }];
    
    [_lbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(imgArrow.mas_left).offset(-CELL_INNER_MARGIN);
    }];
}

- (void)setData:(id)data{
    [_imgView setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [_lbName setText:data];
    [_lbDetails setText:@"详情"];
}

@end
