//
//  DeviceSettingCollectionView.h
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^CollectionItemTappedBlock)(void);

@interface DeviceSettingCollectionView : BaseCollectionView

@property (nonatomic, copy) CollectionItemTappedBlock block;

@end
