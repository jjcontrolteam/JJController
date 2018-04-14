//
//  LinkageModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ModelBase.h"

@interface LinkageModel : ModelBase

@property (nonatomic, copy) NSString *iconPic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *room;

@property (nonatomic, copy) NSString *mode;
@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSArray *modeArray;
@property (nonatomic, copy) NSArray *stateArray;

@end
