//
//  DeviceSettingModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingModel.h"

@implementation DeviceSettingModel
 
- (instancetype)initWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details{
    if(self = [super init]){
        _pic = pic;
        _title = title;
        _details = details;
    }
    return self;
}

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details{
    return [[self alloc] initWithPic:pic title:title details:details];
}
 

- (instancetype)initWithType:(DeviceSettingType)type{
    if(self = [super init]){
        _deviceSettingType = type;
    }
    return self;
}

+ (instancetype)modelWithType:(DeviceSettingType)type{
    return [[self alloc] initWithType:type];
}
@end
