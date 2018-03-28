//
//  DeviceSettingDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/3/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingDataSource.h"

@implementation DeviceSettingDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    NSString *currentItem = [self.cellData objectAtIndex:indexPath.row];
    if([currentItem isEqualToString:@"span"]){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:spanIdentifier forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    }
    
    id theme = self.cellData[indexPath.row];
    if (self.cellBlock) {
        self.cellBlock(cell,theme,indexPath);
    }
    return cell;
}

@end
