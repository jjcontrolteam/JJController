//
//  ActualTimeMode.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ActualTimeMode.h"

@implementation ActualTimeMode

- (instancetype)initWithTitle:(NSString *)title{
    if(self = [super init]){
        _timeTitle = title;
    }
    return self;
}

+ (instancetype)modelWithTitle:(NSString *)title{
    return [[[self alloc] init] initWithTitle:title];
}

@end
