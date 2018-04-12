//
//  AddRoomViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UserBaseController.h"
@class ROOM;
typedef void(^AddRoomBlock)(ROOM *room);

@interface AddRoomViewController : UserBaseController

@property (nonatomic, copy) AddRoomBlock addRoomBlock;

@end
