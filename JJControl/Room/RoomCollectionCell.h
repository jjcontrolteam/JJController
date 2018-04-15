//
//  RoomCollectionCell.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//
#import "BaseCollectionViewCell.h"

static NSString *indentifer=@"RoomCollectionCell";

@interface RoomCollectionCell : BaseCollectionViewCell
@property(weak,nonatomic) UIImageView *imgView;
@property(weak,nonatomic) UILabel *lbName;
@property(weak,nonatomic) UILabel *lbDetails;

@end
