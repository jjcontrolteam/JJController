//
//  AllTimingModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimingModel.h"

@interface AllTimingModel : NSObject

@property (nonatomic, strong) TimingModel *firstTime;
@property (nonatomic, strong) TimingModel *secondTime;

@property (nonatomic, strong) NSMutableArray *repeatTime;
@property (nonatomic, assign) BOOL isEnable;

@end
