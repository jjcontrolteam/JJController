//
//  EditTimingViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UserBaseController.h"
#import "AllTimingModel.h"

typedef NS_ENUM(NSInteger, TimingType){
    TimingTypeAdd,
    TimingTypeEdit
};

@interface EditTimingViewController : UserBaseController

@property (nonatomic, assign) TimingType timingType;

@property (nonatomic, strong) AllTimingModel *currntAllTiming;

@end
