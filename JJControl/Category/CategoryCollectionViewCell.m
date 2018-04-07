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
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];
    
    _lbName = [[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];

    _lbDetails = [[UILabel alloc]init];
    _lbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];

    _imgArrow = [[UIImageView alloc]init];
    _imgArrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imgArrow];
    [_imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/right.png"]];
    [_imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.equalTo(@(SCREEN_WIDTH * 0.03));
    }];

    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];

    [_lbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(_imgArrow.mas_left).offset(-CELL_INNER_MARGIN);
    }];
}

- (void)setData:(id)data{
    CategoryCellModel *model = (CategoryCellModel *)data;
    [_imgView setImage:[UIImage imageNamed:model.pic]];
    [_lbName setText:model.title];
    [_lbDetails setText:model.details];
} 
@end
