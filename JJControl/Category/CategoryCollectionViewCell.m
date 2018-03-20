//
//  CategoryCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CategoryCollectionViewCell.h"
#import "CategoryModel.h"

@interface CategoryCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UILabel *_lbDetails;
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

    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(12,12, 26, 26)];
    [self addSubview:_imgView];
    
    _lbName =[[UILabel alloc]initWithFrame:CGRectMake(48, 0,200, 50)];
    [self addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    _lbDetails =[[UILabel alloc]initWithFrame:CGRectMake(248, 0,200, 50)];
    [self addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];
    
    UIImageView *imgArrow = [[UIImageView alloc]initWithFrame:CGRectMake(300,12, 10, 10)];
    [self addSubview:imgArrow];
    [imgArrow setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];

}

- (void)setData:(id)data{
    CategoryModel *model = (CategoryModel *)data;
    [_imgView setImage:[UIImage imageNamed:model.pic]];
    [_lbName setText:model.title];
    [_lbDetails setText:model.details];
}

@end
