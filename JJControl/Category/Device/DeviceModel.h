//
//  DeviceModel.h
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceModel : NSObject

@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isOn;

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title isOn:(BOOL)isOn;


@end
