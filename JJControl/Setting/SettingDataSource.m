//
//  SettingDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/3/24.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingDataSource.h"
#import "DeviceSettingModel.h"

@implementation SettingDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    DeviceSettingModel *model = [self.cellData objectAtIndex:indexPath.row];
    if(model.deviceSettingType == DeviceSettingTypeSpan){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:spanIdentifier forIndexPath:indexPath];
    }else if(model.deviceSettingType == DeviceSettingTypeButton){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:buttonIndentifier forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:settingIdentifier forIndexPath:indexPath];
    }
    return cell;
}


@end
