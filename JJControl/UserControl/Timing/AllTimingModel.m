//
//  AllTimingModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AllTimingModel.h"

@implementation AllTimingModel

- (instancetype)init{
    if(self = [super init]){
        _firstTime = [[TimingModel alloc] init];
        _secondTime = [[TimingModel alloc] init];
    }
    return self;
}

@end
