//
//  TIMING.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIMING : NSObject
@property(nonatomic,assign) NSInteger  _id;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  DEVICE_ID;
@property(nonatomic,assign) NSInteger  SCENE_ID;
@property(nonatomic,assign) NSInteger  ENABLE;
@property(nonatomic,assign) NSInteger  ITEM1__TYPE;

@property(nonatomic,assign) NSInteger  ITEM1__ON;
@property(nonatomic,assign) NSInteger  ITEM1__SUN_ADJUST;
@property(nonatomic,assign) NSInteger  ITEM2__TYPE;
@property(nonatomic,assign) NSInteger  ITEM2__ON;
@property(nonatomic,assign) NSInteger  ITEM2__SUN_ADJUST;
@property(nonatomic,assign) NSInteger  REPEAT;
@property(nonatomic,assign) NSInteger  EXECUTED;
 
@property(nonatomic,copy)   NSString * ITEM1__TIME;
@property(nonatomic,copy)   NSString * ITEM2__ACTION;
@property(nonatomic,copy)   NSString * ITEM2__TIME;
@property(nonatomic,copy)   NSString * ITEM1__ACTION;
@end
