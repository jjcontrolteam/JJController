//
//  DeviceSettingCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingCollectionViewCell.h"


@interface DeviceSettingCollectionViewCell(){
    
    
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
    
    UIImageView *tmpImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    tmpImgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmpImgView];
    [tmpImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
    }];
    self.imgView =  tmpImgView;
    
    UILabel *tmplbName = [[UILabel alloc]init];
    tmplbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmplbName];
    [tmplbName setTextAlignment:NSTextAlignmentLeft];
    [tmplbName setFont:[UIFont systemFontOfSize:16]];
    [tmplbName setTextColor:[UIColor blackColor]];
    
    [tmplbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(2 * CELL_INNER_MARGIN);
    }];
    self.lbName=tmplbName;
    
    UILabel *tmplbDetails = [[UILabel alloc]init];
    tmplbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmplbDetails];
    [tmplbDetails setTextAlignment:NSTextAlignmentLeft];
    [tmplbDetails setFont:[UIFont systemFontOfSize:16]];
    [tmplbDetails setTextColor:[UIColor blackColor]];
    
    
    UIImageView *imgArrow = [[UIImageView alloc]init];
    [self.contentView addSubview:imgArrow];
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/right.png"]];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.equalTo(@(SCREEN_WIDTH * 0.03));
    }];
    
    [tmplbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(imgArrow.mas_left).offset(-CELL_INNER_MARGIN);
    }];
    
    self.lbDetails=tmplbDetails;
    
}

 
@end
