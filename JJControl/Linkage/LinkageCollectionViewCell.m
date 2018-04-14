//
//  LinkageCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageCollectionViewCell.h"
#import "LinkageModel.h"

@interface LinkageCollectionViewCell(){
    UIImageView *_imgView;
    UILabel *_lbName;
    UILabel *_lbLocate;
    
    UILabel *_lbModel;  //变为   立即
    UILabel *_lbState;  //有人   打开
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
    
    _imgView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];
    
    _lbName =[[UILabel alloc]init];
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];

    _lbLocate = [[UILabel alloc]init];
    [self.contentView addSubview:_lbLocate];
    [_lbLocate setTextAlignment:NSTextAlignmentLeft];
    [_lbLocate setFont:[UIFont systemFontOfSize:16]];
    [_lbLocate setTextColor:[UIColor blackColor]];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    [_lbLocate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    
    _lbModel =[[UILabel alloc]init];
    [self.contentView addSubview:_lbModel];
    [_lbModel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_lbModel setTextAlignment:NSTextAlignmentLeft];
    [_lbModel setFont:[UIFont systemFontOfSize:16]];
    [_lbModel setTextColor:[UIColor greenColor]];
    
    _lbState =[[UILabel alloc]init];
    [self.contentView addSubview:_lbState];
    [_lbState setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_lbState setTextAlignment:NSTextAlignmentLeft];
    [_lbState setFont:[UIFont systemFontOfSize:16]];
    [_lbState setTextColor:[UIColor greenColor]];
    
    [_lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
    }];
    [_lbModel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(_lbState.mas_left).offset(-CELL_INNER_MARGIN);
    }];
}

- (void)setCellData:(id)cellData{
    if([cellData isKindOfClass:[NSString class]]){
        //联动名称:cellData
        _imgView.hidden = YES;

        _lbLocate.hidden = YES;
        _lbState.hidden = YES;
        _lbModel.hidden = YES;
        [_lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
            make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
            make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        }];
        _lbName.text = [NSString stringWithFormat:@"联动名称: %@", cellData];

    }else{
        _imgView.hidden = NO;
        _lbLocate.hidden = NO;
        _lbState.hidden = NO;
        _lbModel.hidden = NO;
        
        _imgView.image = [UIImage imageNamed:@"JJControlResource.bundle/right.png"];
        [_lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
        }];

        _lbName.text = @"红外感应";
        _lbLocate.text = @"二层卫生间";
        _lbModel.text = @"立即";
        _lbState.text = @"打开";
        
        LinkageModel *model = cellData;
        _imgView.hidden = NO;
        _lbLocate.hidden = NO;
        _lbState.hidden = NO;
        _lbModel.hidden = NO;

        [_lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
        }];

        _imgView.image = [UIImage imageNamed:model.iconPic];
        _lbName.text = model.title;
        _lbLocate.text = model.room;
        _lbModel.text = model.mode;
        _lbState.text = model.state;
        
    }
}

@end

