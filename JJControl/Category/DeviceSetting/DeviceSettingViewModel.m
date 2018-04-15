//
//  DeviceSettingViewModel.m
//  JJControl
//
//  Created by admin on 27/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "DeviceSettingViewModel.h"
#import "DeviceModel.h"
#import "DeviceSettingModel.h"
#import "DeviceSettingCollectionViewCell.h"
@implementation DeviceSettingViewModel

- (void)fetchData:(fetchBlock)block{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    DeviceSettingModel *model = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model];
    
    DeviceSettingModel *modelTitle = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:nil details:@"水晶灯"];
    modelTitle.type = @"title";
    modelTitle.deviceSettingType = DeviceSettingTypeTitle;
    modelTitle.selectionArray = @[[DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"水晶灯" isOn:YES],
                                  [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"摄灯" isOn:NO],
                                  [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"壁灯" isOn:NO],
                                  [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"楼道" isOn:NO]];
    [array addObject:modelTitle];
    
    DeviceSettingModel *modelRoom = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"房间" details:@"一层客厅"];
    modelRoom.type = @"room";
    modelRoom.selectionArray = @[[DeviceModel modelWithTitle:@"一层客厅" isOn:YES],
                                 [DeviceModel modelWithTitle:@"二层厨房" isOn:NO],
                                 [DeviceModel modelWithTitle:@"三层厕所" isOn:NO],
                                 [DeviceModel modelWithTitle:@"四层楼道" isOn:NO]];
    modelRoom.deviceSettingType = DeviceSettingTypeSelection;
    [array addObject:modelRoom];
    
    DeviceSettingModel *model1 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model1];
    
    DeviceSettingModel *modelTimer = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/timing.png" title:@"定时" details:@"0个"];
    modelTimer.type = @"timer";
    [array addObject:modelTimer];
    
    DeviceSettingModel *modelDaojishi = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"倒计时" details:@"15分钟"];
    modelDaojishi.type = @"daojishi";
    modelDaojishi.deviceSettingType = DeviceSettingTypeSelection;
    modelDaojishi.selectionArray = @[[DeviceModel modelWithTitle:@"1分钟" isOn:NO],
                                      [DeviceModel modelWithTitle:@"5分钟" isOn:NO],
                                      [DeviceModel modelWithTitle:@"15分钟" isOn:YES],
                                      [DeviceModel modelWithTitle:@"30分钟" isOn:NO]];
    [array addObject:modelDaojishi];
    
    DeviceSettingModel *modelLongest = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"最长开启" details:@"未设定"];
    modelLongest.type = @"longest";
    modelLongest.deviceSettingType = DeviceSettingTypeSelection;
    modelLongest.selectionArray = @[[DeviceModel modelWithTitle:@"未设定" isOn:YES],
                                    [DeviceModel modelWithTitle:@"1分钟" isOn:NO],
                                    [DeviceModel modelWithTitle:@"5分钟" isOn:NO],
                                    [DeviceModel modelWithTitle:@"30分钟" isOn:NO]];
    [array addObject:modelLongest];
    
    DeviceSettingModel *model2 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model2];
    
    DeviceSettingModel *modelShare = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/share.png" title:@"分享" details:@"0个"];
    modelShare.type = @"share";
    [array addObject:modelShare];
    
    DeviceSettingModel *modelBind = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"开关绑定" details:@"0个"];
    modelBind.type = @"bind";
    [array addObject:modelBind];
    
    DeviceSettingModel *modelPWD = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备密码" details:@"未启用"];
    modelPWD.deviceSettingType = DeviceSettingTypeSelection;
    modelPWD.type = @"PWD";
    modelPWD.selectionArray = @[[DeviceModel modelWithTitle:@"未启用" isOn:YES],
                                [DeviceModel modelWithTitle:@"启用" isOn:NO]];
    [array addObject:modelPWD];
    
    DeviceSettingModel *model3 = [DeviceSettingModel modelWithType:DeviceSettingTypeSpan];
    [array addObject:model3];
    
    DeviceSettingModel *modelBelong = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"所属控制器" details:@"P16S"];
    modelBelong.type = @"belong";
    [array addObject:modelBelong];
    
    DeviceSettingModel *modelHidden = [DeviceSettingModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备隐藏" details:nil];
    modelHidden.deviceSettingType = DeviceSettingTypeMultiSelection;
    modelHidden.type = @"hidden";
    modelHidden.selectionArray =  @[[DeviceModel modelWithTitle:@"在全部列表中隐藏" isOn:YES],
                                    [DeviceModel modelWithTitle:@"在房间列表中隐藏" isOn:YES],
                                    [DeviceModel modelWithTitle:@"在卧室列表中隐藏" isOn:YES],
                                    [DeviceModel modelWithTitle:@"在二楼列表中隐藏" isOn:NO]];
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

- (void)updateCell:(UICollectionViewCell *)cell withData:(id)model{
    DeviceSettingModel *cellData=(DeviceSettingModel*)model;
    DeviceSettingCollectionViewCell*cellview=(DeviceSettingCollectionViewCell*)cell;
    if(cellData.pic)
        [cellview.imgView setImage:[UIImage imageNamed:cellData.pic]];
    else
        [cellview.imgView setImage:nil];
    
    if(cellData.title)
        [cellview.lbName setText:cellData.title];
    else
        [cellview.lbName setText:nil];
    
    if(cellData.details)
        [cellview.lbDetails setText:cellData.details];
    else
        [cellview.lbDetails setText:nil];
    
    if(cellData.deviceSettingType == DeviceSettingTypeTitle){
        [cellview.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(SCREEN_WIDTH / 8.0);
        }];
    }else{
        [cellview.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(SCREEN_WIDTH / 15.0);
        }];
    }
}

@end
