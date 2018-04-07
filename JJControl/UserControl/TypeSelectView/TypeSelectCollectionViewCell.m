//
//  TypeSelectCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TypeSelectCollectionViewCell.h"
#import "DeviceModel.h"

@interface TypeSelectCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UIImageView *_selectView;
}

@end

@implementation TypeSelectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
    }];
    
    _lbName = [[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(_imgView.mas_right).offset(2 * CELL_INNER_MARGIN);
    }];
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 10, 25, 25)];
    _selectView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_selectView];
    [_selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(- 2 * CELL_RIGHT_MARGIN);
        make.centerY.equalTo(self);
        make.width.height.equalTo(self.mas_height).multipliedBy(0.3);
    }];
}

- (void)setCellData:(DeviceModel *)cellData{
    
    [_lbName setText:cellData.title];
    [_imgView setImage:[UIImage imageNamed:cellData.pic]];
    
    if(cellData.isOn){
        _selectView.image = [UIImage imageNamed:@"JJControlResource.bundle/bind.png"];
    }else{
        _selectView.image = nil;
    }
}

@end
