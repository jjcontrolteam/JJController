//
//  IconChangeViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconChangeViewModel.h"
#import "DeviceModel.h"

@interface IconChangeViewModel()

@property (nonatomic, strong) DeviceModel *deviceModel;

@end

@implementation IconChangeViewModel

- (instancetype)initWithModel:(DeviceModel *)deviceModel{
    if(self = [super init]){
        _deviceModel = deviceModel;
    }
    return self;
}

- (void)fetchData:(fetchBlock)block{
    block(@[@[_deviceModel],@[_deviceModel]]);
}

- (void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@"图标", @"名称"]);
}


@end
