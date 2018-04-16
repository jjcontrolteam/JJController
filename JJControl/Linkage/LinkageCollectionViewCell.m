//
//  LinkageCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageCollectionViewCell.h"


@interface LinkageCollectionViewCell(){
    
}
@end

@implementation LinkageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    
    UIImageView *tmpimgView = [[UIImageView alloc]init];
    [self.contentView addSubview:tmpimgView];
    [tmpimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 20.0);
    }];
    self.imgView=tmpimgView;
    
   
    UILabel *tmplbLocate = [[UILabel alloc]init];
    [self.contentView addSubview:tmplbLocate];
    [tmplbLocate setTextAlignment:NSTextAlignmentLeft];
    [tmplbLocate setFont:[UIFont systemFontOfSize:16]];
    [tmplbLocate setTextColor:[UIColor blackColor]];
    self.lbLocate=tmplbLocate;
    
    UILabel *tmplbName =[[UILabel alloc]init];
    [self addSubview:tmplbName];
    [tmplbName setTextAlignment:NSTextAlignmentLeft];
    [tmplbName setFont:[UIFont systemFontOfSize:16]];
    [tmplbName setTextColor:[UIColor blackColor]];
    self.lbName=tmplbName;
    
    [_lbLocate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    
    UILabel *tmplbModel =[[UILabel alloc]init];
    [self.contentView addSubview:tmplbModel];
    [tmplbModel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [tmplbModel setTextAlignment:NSTextAlignmentLeft];
    [tmplbModel setFont:[UIFont systemFontOfSize:16]];
    [tmplbModel setTextColor:[UIColor greenColor]];
    self.lbModel=tmplbModel;
    
    UILabel *tmplbState =[[UILabel alloc]init];
    [self.contentView addSubview:tmplbState];
    [tmplbState setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [tmplbState setTextAlignment:NSTextAlignmentLeft];
    [tmplbState setFont:[UIFont systemFontOfSize:16]];
    [tmplbState setTextColor:[UIColor greenColor]];
    self.lbState=tmplbState;
    
    [_lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
    }];
    [_lbModel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(_lbState.mas_left).offset(-CELL_INNER_MARGIN);
    }];
}


@end

