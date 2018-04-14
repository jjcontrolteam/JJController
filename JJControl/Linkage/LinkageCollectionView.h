//
//  LinkageCollectionView.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^CellTappedBlock)(id data, NSIndexPath * indexPath);

@interface LinkageCollectionView : BaseCollectionView

@property (nonatomic, copy) CellTappedBlock cellTappedBlock;

@end
