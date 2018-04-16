//
//  LinkageDataDelegate.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageDataDelegate.h"

@implementation LinkageDataDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return CGSizeMake(SCREEN_WIDTH, 44);
    }else if(section == 2){
        return CGSizeMake(SCREEN_WIDTH, 70);
    }else{
        return CGSizeMake(SCREEN_WIDTH, 50);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return CGSizeMake(SCREEN_WIDTH, 44);
    }else if(indexPath.section == 2){
        return CGSizeMake(SCREEN_WIDTH, 0.0001);
    }else{
        return CGSizeMake(SCREEN_WIDTH, 50);
    }
}

@end
