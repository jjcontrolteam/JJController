//
//  SettingDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/3/24.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingDataSource.h"

@implementation SettingDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    NSString *currentItem = [self.cellData objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:infoIdentifier forIndexPath:indexPath];
    }else if([currentItem isEqualToString:@"span"]){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:spanIdentifier forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:settingIdentifier forIndexPath:indexPath];
    }
    
    id theme = self.cellData[indexPath.row];
    if (self.cellBlock) {
        self.cellBlock(cell,theme,indexPath);
    }
    return cell;
}




@end
