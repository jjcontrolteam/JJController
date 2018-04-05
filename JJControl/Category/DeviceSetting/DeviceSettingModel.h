//
//  DeviceSettingModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceSettingType){
    DeviceSettingTypeDefault,   //默认
    DeviceSettingTypeSelection,   //多选 选中的打勾
    DeviceSettingTypeMultiSelection,   //多选 选中的打勾
    DeviceSettingTypeSpan,   //空白
    DeviceSettingTypeButton, //按钮
    DeviceSettingTypeTitle, //标题
};

@interface DeviceSettingModel : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *details;
@property (nonatomic, assign) DeviceSettingType deviceSettingType;
@property (nonatomic, copy) NSArray *selectionArray;

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details;
+ (instancetype)modelWithType:(DeviceSettingType)type;


@end
