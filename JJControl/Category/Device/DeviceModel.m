//
//  DeviceModel.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceModel.h"

@implementation DeviceModel

- (instancetype)initWithPic:(NSString *)pic title:(NSString *)title isOn:(BOOL)isOn{
    if(self = [super init]){
        _pic = pic;
        _title = title;
        _isOn = isOn;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title isOn:(BOOL)isOn{
    return [self modelWithPic:nil title:title isOn:isOn];
}


+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title isOn:(BOOL)isOn{
    return [[self alloc] initWithPic:pic title:title isOn:isOn];
}


- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    DeviceModel *model = [[[self class] allocWithZone:zone] init];
    model.pic = [self.pic copy];
    model.title = [self.title copy];
    model.isOn = self.isOn;
    return model;
}

@end
