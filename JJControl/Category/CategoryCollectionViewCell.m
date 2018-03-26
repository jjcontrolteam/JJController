//
//  CategoryCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CategoryCollectionViewCell.h"
#import "CategoryCellModel.h"

@interface CategoryCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UILabel *_lbDetails;
    UIImageView *_imgArrow;
}
@end

@implementation CategoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor whiteColor]];

    _imgView = [[UIImageView alloc]init];
    _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(self.mas_height).multipliedBy(0.5);
        make.height.mas_equalTo(self).multipliedBy(0.5);
    }];
    
    _lbName = [[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    _lbDetails = [[UILabel alloc]init];
    _lbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];
    
    _imgArrow = [[UIImageView alloc]init];
    _imgArrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_imgArrow];
    [_imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [_imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-20);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.05);
        make.height.mas_equalTo(self.mas_width).multipliedBy(0.05);
    }];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgView.mas_right).offset(20);
        make.right.mas_equalTo(_lbDetails.mas_left).offset(-20);
        make.centerY.mas_equalTo(self);
    }];
    
    [_lbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_lbName.mas_right).offset(20);
        make.right.mas_equalTo(_imgArrow.mas_left).offset(-20);
        make.centerY.mas_equalTo(self);
    }];
}

- (void)setData:(id)data{
    CategoryCellModel *model = (CategoryCellModel *)data;
    [_imgView setImage:[UIImage imageNamed:model.pic]];
    [_lbName setText:model.title];
    [_lbDetails setText:model.details];
}

@end
