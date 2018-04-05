//
//  ButtonCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ButtonCollectionViewCell.h"
#import "DeviceSettingModel.h"
#import "ButtonCollectionViewCell.h"

@interface ButtonCollectionViewCell(){
    UILabel *_buttonLabel;
}
@end

@implementation ButtonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    _buttonLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_buttonLabel];
    [_buttonLabel setTextAlignment:NSTextAlignmentLeft];
    [_buttonLabel setFont:[UIFont systemFontOfSize:16]];
    [_buttonLabel setTextColor:[UIColor blackColor]];
    
    [_buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(2 * CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(- 2 * CELL_BOTTOM_MARGIN);
    }];
}

- (void)setCellData:(DeviceSettingModel *)cellData{
    [_buttonLabel setText:cellData.title];
}

@end
