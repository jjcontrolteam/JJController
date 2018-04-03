//
//  DEVICE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEVICE : NSObject 
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign)   NSInteger  PORT;
@property(nonatomic,assign) NSInteger  COMMUNICATION;
@property(nonatomic,assign) NSInteger  TYPE;
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * ICON_PATH;
@property(nonatomic,assign) NSInteger  ROOM_ID;
@property(nonatomic,assign) NSInteger  ENABLE;
@property(nonatomic,assign) NSInteger  HIDE;


@property(nonatomic,assign) NSInteger  IS_FEEDBACK;
@property(nonatomic,assign) NSInteger  SEQUENCE_ALL;
@property(nonatomic,assign) NSInteger  SEQUENCE_ROOM;
@property(nonatomic,assign) NSInteger  SEQUENCE_FLOOR;
@property(nonatomic,assign) NSInteger  COUNT_DOWN;
@property(nonatomic,assign) NSInteger  MAX_ON;

@property(nonatomic,assign) NSInteger  ADJUST;
@property(nonatomic,assign) NSInteger  VALUE1;
@property(nonatomic,copy)   NSString * PASSWORD;
@property(nonatomic,copy)   NSString * REMARK;
@end
