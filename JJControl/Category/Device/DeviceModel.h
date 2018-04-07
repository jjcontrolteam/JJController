//
//  DeviceModel.h
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceModelType){
    DeviceModelTypeSwitch,  //开关
    DeviceModelTypeDispaly  //只用于展示
};

@interface DeviceModel : NSObject

@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isOn;

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title isOn:(BOOL)isOn;


@end
