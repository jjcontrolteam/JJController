//
//  SpanCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/24.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SpanCollectionViewCell.h"

@implementation SpanCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor redColor]];
    
    UIView *lineView = [[UIView alloc] init];
    [self.contentView addSubview:lineView];
 
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(10);
        make.top.mas_equalTo(self.contentView).offset(0);
    }];
}

- (void)setCellData:(id)cellData{
    
}

@end
