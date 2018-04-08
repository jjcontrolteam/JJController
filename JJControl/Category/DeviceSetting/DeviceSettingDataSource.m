//
//  DeviceSettingDataSource.m
//  JJControl
//
//  Created by YvanWang on 2018/3/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingDataSource.h"
#import "DeviceSettingModel.h"

@implementation DeviceSettingDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    DeviceSettingModel *model = [self.cellData objectAtIndex:indexPath.row];
    if(model.deviceSettingType == DeviceSettingTypeSpan){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:spanIdentifier forIndexPath:indexPath];
    }else if(model.deviceSettingType == DeviceSettingTypeButton){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:buttonIdentifier forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    }
    return cell;
}
@end
