//
//  InfoCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/24.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "InfoCollectionViewCell.h"

@interface InfoCollectionViewCell(){
    UIImageView *_avaterImageView;
    UILabel *_nameLabel;
    UILabel *_idLabel;
}
@end

@implementation InfoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor yellowColor]];
    
    _avaterImageView = [[UIImageView alloc]init];
    _avaterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_avaterImageView];
    [_avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.height.width.mas_equalTo(SCREEN_WIDTH * 0.15);
    }];

    _nameLabel =[[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_nameLabel setTextAlignment:NSTextAlignmentLeft];
    [_nameLabel setFont:[UIFont systemFontOfSize:20]];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_nameLabel];


    _idLabel =[[UILabel alloc]init];
    _idLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_idLabel setTextAlignment:NSTextAlignmentLeft];
    [_idLabel setFont:[UIFont systemFontOfSize:18]];
    [_idLabel setTextColor:[UIColor blackColor]];
    [self.contentView addSubview:_idLabel];


    UIImageView *imgArrow = [[UIImageView alloc]init];
    imgArrow.translatesAutoresizingMaskIntoConstraints = NO;
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [self.contentView addSubview:imgArrow];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.mas_equalTo(self.contentView.mas_height).multipliedBy(0.3);
    }];

    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avaterImageView.mas_right).offset(CELL_INNER_MARGIN);
        make.bottom.equalTo(self.contentView.mas_centerY);
    }];

    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avaterImageView.mas_right).offset(CELL_INNER_MARGIN);
        make.top.equalTo(self.contentView.mas_centerY);
    }];
}


- (void)setCellData:(id)cellData{
    _avaterImageView.image = [UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"];
    
    _nameLabel.text = @"ThinkHome";
    _idLabel.text = @"帐号:13912222211";
}

@end
