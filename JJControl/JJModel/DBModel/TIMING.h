//
//  TIMING.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIMING : NSObject 
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  deviceID;
@property(nonatomic,assign) NSInteger  sceneID;
@property(nonatomic,assign) NSInteger  ENABLE;
@property(nonatomic,assign) NSInteger  item1_Type;

@property(nonatomic,assign) NSInteger  item1_ON;
@property(nonatomic,assign) NSInteger  item1_SunAdjust;
@property(nonatomic,assign) NSInteger  item2_Type;
@property(nonatomic,assign) NSInteger  item2_ON;
@property(nonatomic,assign) NSInteger  item2_SunAdjust;
@property(nonatomic,assign) NSInteger  REPEAT;
@property(nonatomic,assign) NSInteger  EXECUTED;
 
@property(nonatomic,copy)   NSString * item1_Time;
@property(nonatomic,copy)   NSString * item2_Action;
@property(nonatomic,copy)   NSString * item2_Time;
@property(nonatomic,copy)   NSString * item1_Action;
@property(nonatomic,copy)   NSString * ID;
@end
