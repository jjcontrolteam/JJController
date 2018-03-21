//
//  SettingCollectionView.h
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^CollectionCellTappedBlock)(void);

@interface SettingCollectionView : BaseCollectionView

@property (nonatomic, copy) CollectionCellTappedBlock block;

@end
