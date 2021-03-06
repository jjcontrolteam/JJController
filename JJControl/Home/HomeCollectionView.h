//
//  HomeCollectionView.h
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

typedef void(^HomeCellTappedBlock)(id data);
typedef void(^HomeAddTappedBlock)(NSInteger index);
@interface HomeCollectionView : BaseCollectionView

@property (nonatomic, copy) HomeCellTappedBlock cellTappedBlock;
@property (nonatomic, copy) HomeAddTappedBlock addTappedBlock;
@end
