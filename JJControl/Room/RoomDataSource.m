//
//  RoomDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomDataSource.h"
#import "BannerCollectionViewCell.h"
#import "RoomCollectionCell.h"

@implementation RoomDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if(indexPath.section == 0){ //轮播图
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:bannerCollectionViewCell forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifer forIndexPath:indexPath];
    }
    return cell;
}

@end
