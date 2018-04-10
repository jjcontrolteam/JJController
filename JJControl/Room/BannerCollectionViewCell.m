//
//  BannerCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BannerCollectionViewCell.h"
#import "SDCycleScrollView.h"
@interface BannerCollectionViewCell(){
    SDCycleScrollView *_cycleScrollView;
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
    
    _cycleScrollView = [[SDCycleScrollView alloc] init];
    _cycleScrollView.backgroundColor = [UIColor blueColor];
    _cycleScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_cycleScrollView];
    
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.width.height.equalTo(@(SCREEN_WIDTH));
    }];
}

- (void)setCellData:(id)cellData{
    _cycleScrollView.imageURLStringsGroup = cellData;
} 

@end
