//
//  DeviceSettingCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingCollectionViewCell.h"
#import "DeviceSettingModel.h"

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
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
    }];
    
    _lbName = [[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(2 * CELL_INNER_MARGIN);
    }];
    
    _lbDetails = [[UILabel alloc]init];
    _lbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];
    
    UIImageView *imgArrow = [[UIImageView alloc]init];
    [self.contentView addSubview:imgArrow];
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/right.png"]];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.equalTo(@(SCREEN_WIDTH * 0.03));
    }];
    
    [_lbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(imgArrow.mas_left).offset(-CELL_INNER_MARGIN);
    }];
}

- (void)setCellData:(DeviceSettingModel *)cellData{
    if(cellData.pic)
        [_imgView setImage:[UIImage imageNamed:cellData.pic]];
    if(cellData.title)
        [_lbName setText:cellData.title];
    if(cellData.details)
        [_lbDetails setText:cellData.details];

    if(cellData.deviceSettingType == DeviceSettingTypeTitle){
        [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(SCREEN_WIDTH / 8.0);
        }];
    }else{
        [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
        }];
    }
}

@end
