//
//  SettingCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingCollectionViewCell.h"

@interface SettingCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
}
@end

@implementation SettingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor purpleColor]];
    
    _imgView = [[UIImageView alloc]init];
    _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_height).multipliedBy(0.5);
        make.height.mas_equalTo(self).multipliedBy(0.5);
    }];
    
    _lbName =[[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:18]];
    [_lbName setTextColor:[UIColor blackColor]];
    [self addSubview:_lbName];

    UIImageView *imgArrow = [[UIImageView alloc]init];
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [self addSubview:imgArrow];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-20);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.05);
        make.height.mas_equalTo(self.mas_width).multipliedBy(0.05);
    }];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgView.mas_right).offset(20);
        make.right.mas_equalTo(imgArrow.mas_left).offset(-20);
        make.centerY.mas_equalTo(self);
    }];
}

- (void)setCellData:(id)cellData{
    [_imgView setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [_lbName setText:cellData];
}

@end
