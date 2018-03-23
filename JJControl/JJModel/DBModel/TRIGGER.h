//
//  TRIGGER.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TRIGGER : NSObject
@property(nonatomic,assign) NSInteger  _id;
@property(nonatomic,assign) NSInteger  LINKAGE_ID;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  AND_OR;
@property(nonatomic,assign) NSInteger  FLAG;
@property(nonatomic,assign) NSInteger  TYPE;

@property(nonatomic,assign) NSInteger  REPEAT;
@property(nonatomic,assign) NSInteger  EXECUTED;
@property(nonatomic,assign) NSInteger  DEVICE_ID;
@property(nonatomic,assign) NSInteger  PARENT2;
@property(nonatomic,assign) NSInteger  RANGE;
@property(nonatomic,copy)   NSString * TIME_START;
@property(nonatomic,copy)   NSString * TIME_END;

@end
