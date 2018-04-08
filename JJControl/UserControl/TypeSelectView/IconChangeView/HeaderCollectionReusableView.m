//
//  HeaderCollectionReusableView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@interface HeaderCollectionReusableView(){
    UILabel *_titleLabel;
}
@end

@implementation HeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    self.backgroundColor = [UIColor lightGrayColor];
    
    _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [_titleLabel setFont:[UIFont systemFontOfSize:20]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [self addSubview:_titleLabel];
    
}
 
- (void)setCellData:(id)cellData{
    _titleLabel.text = cellData;
 }


@end
