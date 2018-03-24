//
//  SettingDataDelegate.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingDataDelegate.h"

@implementation SettingDataDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *currentItem = [self.items objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    }
    else if([currentItem isEqualToString:@"span"]){
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 20);
    }else{
        return [super collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
}


@end
