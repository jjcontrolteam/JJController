//
//  SettingCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingCollectionViewCell.h"
#import "DeviceSettingModel.h"

@interface SettingCollectionViewCell(){
    
}

@property (nonatomic, strong) UIImageView *imgViewLeft;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UIImageView *imgArrow;

@end

@implementation SettingCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor whiteColor]];

    [self.contentView addSubview:self.imgViewLeft];
    [self.contentView addSubview:self.lbTitle];
    [self.contentView addSubview:self.imgArrow];

    [self.imgViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];

    [self.imgArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
        make.width.height.equalTo(@(SCREEN_WIDTH * 0.03));
    }];

    [self.lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgViewLeft.mas_right).offset(CELL_INNER_MARGIN);
    }];
}


- (UIImageView *)imgViewLeft{
    if(!_imgViewLeft){
        _imgViewLeft = [[UIImageView alloc]init];
        _imgViewLeft.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imgViewLeft;
}

- (UILabel *)lbTitle{
    if(!_lbTitle){
        _lbTitle = [[UILabel alloc]init];
        _lbTitle.translatesAutoresizingMaskIntoConstraints = NO;
        [_lbTitle setTextAlignment:NSTextAlignmentLeft];
        [_lbTitle setFont:[UIFont systemFontOfSize:18]];
        [_lbTitle setTextColor:[UIColor blackColor]];
    }
    return _lbTitle;
}

- (UIImageView *)imgArrow{
    if(!_imgArrow){
        _imgArrow = [[UIImageView alloc]init];
        [_imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/right.png"]];
    }
    return _imgArrow;
}

- (void)setCellData:(DeviceSettingModel *)cellData{
    [self.imgViewLeft setImage:[UIImage imageNamed:cellData.pic]];
    [self.lbTitle setText:cellData.title];
}

@end
