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
@property(nonatomic,copy)   NSString * iconPath;
@property(nonatomic,assign) NSInteger  roomId;
@property(nonatomic,assign) NSInteger  ENABLE;
@property(nonatomic,assign) NSInteger  HIDE;
@property(nonatomic,copy)   NSString * ID;

@property(nonatomic,assign) NSInteger  isFeedback;
@property(nonatomic,assign) NSInteger  SEQUENCE_ALL;
@property(nonatomic,assign) NSInteger  SEQUENCE_ROOM;
@property(nonatomic,assign) NSInteger  SEQUENCE_FLOOR;
@property(nonatomic,assign) NSInteger  countDown;
@property(nonatomic,assign) NSInteger  maxON;

@property(nonatomic,assign) NSInteger  ADJUST;
@property(nonatomic,assign) NSInteger  VALUE1;
@property(nonatomic,copy)   NSString * PASSWORD;
@property(nonatomic,copy)   NSString * REMARK;
@end
