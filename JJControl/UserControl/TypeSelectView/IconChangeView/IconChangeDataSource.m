//
//  IconChangeDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconChangeDataSource.h"

@implementation IconChangeDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if(indexPath.section == 0){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:IconIdentifier forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:nameIdentifier forIndexPath:indexPath];
    }
    return cell;
}
@end
