//
//  BannerCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BannerCollectionViewCell.h"

@interface BannerCollectionViewCell(){
    UILabel *_label;
}
@end

@implementation BannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    self.backgroundColor = [UIColor redColor];
    
    _label = [[UILabel alloc] init];
    _label.backgroundColor = [UIColor blueColor];
    [self addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self).offset(-CELL_BOTTOM_MARGIN);
        make.width.height.equalTo(@150);
    }];
}

- (void)setCellData:(id)cellData{
    _label.text = cellData;
} 

@end
