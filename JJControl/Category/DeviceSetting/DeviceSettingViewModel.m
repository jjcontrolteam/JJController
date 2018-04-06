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
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    DeviceSettingModel *model = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model];
    
    DeviceSettingModel *modelTitle = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:nil details:@"水晶灯"];
    modelTitle.type = @"title";
    modelTitle.deviceSettingType = DeviceSettingTypeTitle;
    modelTitle.selectionArray = @[@"灯光",@"射灯", @"壁灯"];
    [array addObject:modelTitle];
    
    DeviceSettingModel *modelRoom = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"房间" details:@"一层客厅"];
    modelRoom.type = @"room";
    modelRoom.selectionArray = @[@"一层客厅",@"二层", @"三层厨房"];
    modelRoom.deviceSettingType = DeviceSettingTypeSelection;
    [array addObject:modelRoom];
    
    DeviceSettingModel *model1 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model1];
    
    DeviceSettingModel *modelTimer = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"定时" details:@"0个"];
    modelTimer.type = @"timer";
    [array addObject:modelTimer];
    
    DeviceSettingModel *modelDaojishi = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"倒计时" details:@"15分钟"];
    modelDaojishi.type = @"daojishi";
    modelDaojishi.deviceSettingType = DeviceSettingTypeSelection;
    modelDaojishi.selectionArray = @[@"1分钟",@"5分钟", @"30分钟"];
    [array addObject:modelDaojishi];
    
    DeviceSettingModel *modelLongest = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"最长开启" details:@"未设定"];
    modelLongest.type = @"longest";
    modelLongest.deviceSettingType = DeviceSettingTypeSelection;
    modelLongest.selectionArray = @[@"1分钟",@"5分钟", @"30分钟"];
    [array addObject:modelLongest];
    
    DeviceSettingModel *model2 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model2];
    
    DeviceSettingModel *modelShare = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"分享" details:@"0个"];
    modelShare.type = @"share";
    [array addObject:modelShare];
    
    DeviceSettingModel *modelBind = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"开关绑定" details:@"0个"];
    modelBind.type = @"bind";
    [array addObject:modelBind];
    
    DeviceSettingModel *modelPWD = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备密码" details:@"未启用"];
    modelPWD.deviceSettingType = DeviceSettingTypeSelection;
    modelPWD.type = @"PWD";
    modelPWD.selectionArray = @[@"开启",@"不开启"];
    [array addObject:modelPWD];
    
    DeviceSettingModel *model3 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model3];
    
    DeviceSettingModel *modelBelong = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"所属控制器" details:@"P16S"];
    modelBelong.type = @"belong";
    [array addObject:modelBelong];
    
    DeviceSettingModel *modelHidden = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备隐藏" details:nil];
    modelHidden.deviceSettingType = DeviceSettingTypeMultiSelection;
    modelHidden.type = @"hidden";
    modelHidden.selectionArray = @[@"在全部列表中隐藏",@"在房间列表中隐藏"];
    [array addObject:modelHidden];
    
    DeviceSettingModel *modelLog = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"日志" details:nil];
    modelLog.type = @"log";
    [array addObject:modelLog];
    
    DeviceSettingModel *model4 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model4];
    
    DeviceSettingModel *modelButton = [DeviceSettingModel modelWithType:DeviceSettingTypeButton];
    modelButton.title = @"删除";
    modelButton.type = @"delete";
    [array addObject:modelButton];
    
    block(array);
     
}

@end
