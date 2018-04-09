//
//  RoomCollectionCell.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionCell.h"
#import "ROOM.h"
@interface RoomCollectionCell(){
    UIImageView *_imgView;
    UILabel  *_lbName;
    UILabel *_lbDetails;
}
@end
@implementation RoomCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
        
    }
    return self;
}

- (void)createSubviews{
    self.backgroundColor = [UIColor redColor];
    
    _imgView = [[UIImageView alloc]init];
    _imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];
    
    _lbName = [[UILabel alloc]init];
    _lbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbName];
    [_lbName setTextAlignment:NSTextAlignmentLeft];
    [_lbName setFont:[UIFont systemFontOfSize:16]];
    [_lbName setTextColor:[UIColor blackColor]];
    
    _lbDetails = [[UILabel alloc]init];
    _lbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_lbDetails];
    [_lbDetails setTextAlignment:NSTextAlignmentLeft];
    [_lbDetails setFont:[UIFont systemFontOfSize:16]];
    [_lbDetails setTextColor:[UIColor blackColor]];
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_LEFT_MARGIN);
    }];
    
    [_lbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(- 3 * CELL_RIGHT_MARGIN);
    }];
}


- (void)setCellData:(ROOM *)cellData{
    NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",cellData.iconPath];
    [_imgView setImage:[UIImage imageNamed:imgname]];
    [_lbName setText:cellData.NAME];
    [_lbDetails setText:[NSString stringWithFormat:@"%@",@(cellData.STAR)]];

}
@end
