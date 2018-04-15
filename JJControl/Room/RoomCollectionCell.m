//
//  RoomCollectionCell.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionCell.h"
@interface RoomCollectionCell(){
   
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
    
    UIImageView *tmpimgView = [[UIImageView alloc]init];
    tmpimgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmpimgView];
    [tmpimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 12.0);
    }];
    self.imgView=tmpimgView;
    
    UILabel *tmplbName = [[UILabel alloc]init];
    tmplbName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmplbName];
    [tmplbName setTextAlignment:NSTextAlignmentLeft];
    [tmplbName setFont:[UIFont systemFontOfSize:16]];
    [tmplbName setTextColor:[UIColor blackColor]];
    self.lbName=tmplbName;
    
    UILabel *tmplbDetails = [[UILabel alloc]init];
    tmplbDetails.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:tmplbDetails];
    [tmplbDetails setTextAlignment:NSTextAlignmentLeft];
    [tmplbDetails setFont:[UIFont systemFontOfSize:16]];
    [tmplbDetails setTextColor:[UIColor blackColor]];
    self.lbDetails=tmplbDetails;
    
    [tmplbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_LEFT_MARGIN);
    }];
    
    [tmplbDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(- 3 * CELL_RIGHT_MARGIN);
    }];
}

/*
- (void)setCellData:(ROOM *)cellData{
    NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",cellData.iconPath];
    [_imgView setImage:[UIImage imageNamed:imgname]];
    [_lbName setText:cellData.NAME];
    [_lbDetails setText:[NSString stringWithFormat:@"%@",@(cellData.STAR)]];

}*/
@end
