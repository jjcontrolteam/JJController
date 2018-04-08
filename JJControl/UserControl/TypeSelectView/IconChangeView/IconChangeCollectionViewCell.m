//
//  IconChangeCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconChangeCollectionViewCell.h"
#import "DeviceModel.h"

@interface IconChangeCollectionViewCell(){
    UIImageView *_imgViewOrigin;
}
@end

@implementation IconChangeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    //图标切换
    _imgViewOrigin = [[UIImageView alloc] init];
    _imgViewOrigin.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imgViewOrigin];

    [_imgViewOrigin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.left.mas_equalTo(self.contentView).offset(4 * CELL_LEFT_MARGIN);
        make.width.height.equalTo(@80);
    }];

    UIImageView *imgViewNew = [[UIImageView alloc] init];
    imgViewNew.translatesAutoresizingMaskIntoConstraints = NO;
    imgViewNew.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:imgViewNew];

    [imgViewNew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(_imgViewOrigin);
        make.top.bottom.mas_equalTo(_imgViewOrigin);
        make.right.mas_equalTo(self.contentView).offset(- 4 * CELL_RIGHT_MARGIN);
    }];
}

- (void)setCellData:(DeviceModel *)cellData{
    _imgViewOrigin.image =  [UIImage imageNamed:cellData.pic];
}

@end
