//
//  DeviceSettingCollectionViewCell.h
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCell.h"

@interface DeviceSettingCollectionViewCell : BaseCollectionViewCell
@property(weak,nonatomic) UIImageView *imgView; 
@property(weak,nonatomic) UILabel *lbName;
@property(weak,nonatomic) UILabel *lbDetails;

@end
