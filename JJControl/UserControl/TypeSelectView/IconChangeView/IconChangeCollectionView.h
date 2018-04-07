//
//  IconChangeCollectionView.h
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^CollectionItemTappedBlock)(void);

@interface IconChangeCollectionView : BaseCollectionView

@property (nonatomic, copy) CollectionItemTappedBlock block;


@end
