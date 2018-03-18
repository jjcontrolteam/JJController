//
//  RoomDataDelegate.m
//  JJControl
//
//  Created by admin on 2018/3/18.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomDataDelegate.h"

@implementation RoomDataDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
     return CGSizeMake([UIScreen mainScreen].bounds.size.width, 204);
}

@end
