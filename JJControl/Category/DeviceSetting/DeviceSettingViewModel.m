//
//  DeviceSettingViewModel.m
//  JJControl
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "DeviceSettingViewModel.h"

@implementation DeviceSettingViewModel

- (void)fetchData:(fetchBlock)block{
    block(@[@"房间", @"定时", @"最长市场", @"分享", @"开关绑定", @"设备密码", @"所属控制器"]);
}

@end
