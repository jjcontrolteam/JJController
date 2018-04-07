//
//  TimingModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TimingModel.h"

@implementation TimingModel

- (instancetype)init{
    if(self = [super init]){
        _actualTime = [ActualTimeMode modelWithTitle:@"时间"];
        _sunriseTime = [ActualTimeMode modelWithTitle:@"精准日出时间"];
        _sunsetTime = [ActualTimeMode modelWithTitle:@"精准日落时间"];
    }
    return self;
}

@end
