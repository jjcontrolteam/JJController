//
//  TimingModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActualTimeMode.h"


typedef NS_ENUM(NSInteger, TimeModeType){
    TimeModeTypeSwich,  //开关
    TimeModeTypeMode,   //模式
    TimeModeTypeSpeed,   //风速
    TimeModeTypeTemperture,   //温度
    TimeModeTypePanel,   //面板

};

typedef NS_ENUM(NSInteger, TimeStateType){
    TimeStateTypeOpen,
    TimeStateTypeClose
};

@interface TimingModel : NSObject

@property (nonatomic, assign) TimeModeType timeModeType; //模式 默认开、关
@property (nonatomic, assign) TimeStateType timeStateType;   //打开、关闭啥的

@property (nonatomic, assign) BOOL isSelectSunriseTime;  //是否选中的日出时间，默认未选中
@property (nonatomic, strong) ActualTimeMode *actualTime;   //时间
@property (nonatomic, strong) ActualTimeMode *sunriseTime;   //日出时间
@property (nonatomic, strong) ActualTimeMode *sunsetTime;   //日落时间


@end
