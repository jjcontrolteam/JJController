//
//  DeviceCollectionView.h
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^CollectionItemTappedBlock)(void);

@interface DeviceCollectionView : BaseCollectionView

@property (nonatomic, copy) CollectionItemTappedBlock block;


@end
