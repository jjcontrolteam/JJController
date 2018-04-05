//
//  InfoCollectionReusableView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "InfoCollectionReusableView.h"

@interface InfoCollectionReusableView(){
    UIImageView *_avaterImageView;
    UILabel *_nameLabel;
    UILabel *_idLabel;
}
@end

@implementation InfoCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    _avaterImageView = [[UIImageView alloc]init];
    _avaterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_avaterImageView];
    [_avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(CELL_TOP_MARGIN);
        make.left.mas_equalTo(self).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self).offset(-CELL_BOTTOM_MARGIN);
        make.height.width.mas_equalTo(SCREEN_WIDTH * 0.20);
    }];
    
    _nameLabel =[[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_nameLabel setTextAlignment:NSTextAlignmentLeft];
    [_nameLabel setFont:[UIFont systemFontOfSize:20]];
    [_nameLabel setTextColor:[UIColor blackColor]];
    [self addSubview:_nameLabel];
    
    
    _idLabel =[[UILabel alloc]init];
    _idLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_idLabel setTextAlignment:NSTextAlignmentLeft];
    [_idLabel setFont:[UIFont systemFontOfSize:18]];
    [_idLabel setTextColor:[UIColor blackColor]];
    [self addSubview:_idLabel];
    
    
    UIImageView *imgArrow = [[UIImageView alloc]init];
    imgArrow.translatesAutoresizingMaskIntoConstraints = NO;
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
    [self addSubview:imgArrow];
    [imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(-CELL_RIGHT_MARGIN);
        make.width.height.equalTo(@(SCREEN_WIDTH * 0.03));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avaterImageView.mas_right).offset(CELL_INNER_MARGIN);
        make.bottom.equalTo(self.mas_centerY);
    }];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_avaterImageView.mas_right).offset(CELL_INNER_MARGIN);
        make.top.equalTo(self.mas_centerY);
    }];
}


- (void)setCellData:(id)cellData{
    _avaterImageView.image = [UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"];
    
    _nameLabel.text = @"ThinkHome";
    _idLabel.text = @"帐号:13912222211";
}

@end
