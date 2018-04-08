//
//  TypeSelectViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TypeSelectViewModel.h"
#import "IconChangeViewModel.h"
#import "DeviceModel.h"

@interface TypeSelectViewModel(){
    DeviceModel *_currentDeviceItem;
}

@property (nonatomic, strong) NSMutableArray *deviceItems;

@end

@implementation TypeSelectViewModel

- (instancetype)init{
    if(self = [super init]){
        _deviceItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchData:(fetchBlock)block{
    self.deviceItems = [[NSMutableArray alloc] initWithArray:@[
    [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备1" isOn:NO],
    [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备2" isOn:NO],
    [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备3" isOn:YES],
    [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备4" isOn:NO],
    [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:@"设备5" isOn:NO]]];
    block(self.deviceItems);
}

- (void)changeSelectItem:(NSInteger)index{
    for(NSInteger i = 0; i < self.deviceItems.count; i++){
        DeviceModel *model = [self.deviceItems objectAtIndex:i];
        if(i == index)
            model.isOn = YES;
        else
            model.isOn = NO;
    }
}

- (IconChangeViewModel *)iconChangeViewModelForSelectItem{
    for(NSInteger i = 0; i < self.deviceItems.count; i++){
        DeviceModel *model = [self.deviceItems objectAtIndex:i];
        if(model.isOn == YES){
            return [[IconChangeViewModel alloc] initWithModel:model];
        }
    }
    return nil;
}

@end
