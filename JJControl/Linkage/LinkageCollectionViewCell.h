//
//  LinkageCollectionViewCell.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionViewCell.h"

static NSString *identifier = @"LinkageCollectionViewCell";

@interface LinkageCollectionViewCell : BaseCollectionViewCell
@property(weak,nonatomic)UIImageView *imgView;
@property(weak,nonatomic)UILabel *lbName;
@property(weak,nonatomic)UILabel *lbLocate;
@property(weak,nonatomic)UILabel *lbModel;  //变为   立即
@property(weak,nonatomic)UILabel *lbState;  //有人   打开
@end
