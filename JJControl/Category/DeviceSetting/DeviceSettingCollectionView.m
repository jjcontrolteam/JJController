//
//  DeviceSettingCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingCollectionView.h"
#import "DeviceSettingDataDelegate.h"
#import "DeviceSettingCollectionViewCell.h"
#import "BaseDataSource.h"

static NSString *identifier = @"DeviceSettingCollectionViewCell";

@interface DeviceSettingCollectionView(){
    BaseDataSource *_dataSource;
    DeviceSettingDataDelegate *_delegate;
}

@end

@implementation DeviceSettingCollectionView

- (void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[DeviceSettingCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    _dataSource = [[BaseDataSource alloc] initWithItems:@[@"房间", @"定时", @"最长市场", @"分享", @"开关绑定", @"设备密码", @"所属控制器"] cellIdentifier:identifier headerIdentifier:nil footerIdentifier:nil andCallBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceSettingDataDelegate alloc] initWithItems:@[@"房间", @"定时", @"最长市场", @"分享", @"开关绑定", @"设备密码", @"所属控制器"] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
}

- (void)bindCell:(id)cell withData:(id)data{
    DeviceSettingCollectionViewCell *newCell = (DeviceSettingCollectionViewCell *)cell;
    [newCell setData:data];
}

- (void)chooseCell:(id)data{
    if(self.block){
        self.block();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
