//
//  AddLinkCollectionView.h
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"
typedef void(^LinkCellTappedBlock)(id data);
@interface AddLinkCollectionView : BaseCollectionView
@property (nonatomic, copy) LinkCellTappedBlock cellTappedBlock;
-(void)fetchData1;
@end
