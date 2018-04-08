//
//  SettingViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingViewModel.h"
#import "DeviceSettingModel.h"

@implementation SettingViewModel
-(void)fetchData:(fetchBlock)block{
//    block(@[,@"span", @"消息", @"摇一摇", @"span", @"设备", @"密码", @"通用", @"反馈",@"span", @"退出帐号"]);
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    DeviceSettingModel *model = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model];
    
    DeviceSettingModel *modelMessage = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"消息" details:nil];
    modelMessage.type = @"message";
    [array addObject:modelMessage];
    
    DeviceSettingModel *model1 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model1];
    
    DeviceSettingModel *modelDevice = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备" details:nil];
    modelDevice.type = @"device";
    [array addObject:modelDevice];
    
    DeviceSettingModel *modelPSW = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"密码" details:nil];
    modelPSW.type = @"password";
    [array addObject:modelPSW];
    
    DeviceSettingModel *modelGeneral = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"通用" details:nil];
    modelGeneral.type = @"general";
    [array addObject:modelGeneral];
    
    DeviceSettingModel *modelFeedback = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"反馈" details:nil];
    modelFeedback.type = @"feedback";
    [array addObject:modelFeedback];
    
    DeviceSettingModel *model4 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model4];
    
    DeviceSettingModel *modelButton = [DeviceSettingModel modelWithType:DeviceSettingTypeButton];
    modelButton.title = @"退出账户";
    modelButton.type = @"delete";
    [array addObject:modelButton];
    
    block(array);
    
}

- (void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@{@"avatar":@"JJControlResource.bundle/icon_cj_ys_on.png",@"name":@"ThinkHome",@"id":@"13912222211"}]);
}
@end
