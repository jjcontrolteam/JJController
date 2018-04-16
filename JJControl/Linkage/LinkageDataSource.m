//
//  LinkageDataSource.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageDataSource.h"

@implementation LinkageDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        //定制头部视图的内容
        UICollectionReusableView *headerV =nil;
        if ([indexPath section]==0) {
            headerV= (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LinkageNameReusableView"  forIndexPath:indexPath];
        }else if ([indexPath section]==2) {
            headerV= (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LinkageTipsReusableView"  forIndexPath:indexPath];
        }else{
            headerV= (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LinkageCollectionReusableView"  forIndexPath:indexPath];
        }
        
        reusableView = headerV;
        id theme = self.headerData[indexPath.section];
        if (self.headerBlock) {
            self.headerBlock(headerV,theme,indexPath);
        }
    }
    if (kind ==UICollectionElementKindSectionFooter){
        
    }
    return reusableView;
}
@end
