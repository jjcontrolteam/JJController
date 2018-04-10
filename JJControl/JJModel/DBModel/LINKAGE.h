//
//  LINKAGE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LINKAGE : NSObject 
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  roomID;
@property(nonatomic,assign) NSInteger  ENABLE;
@property(nonatomic,assign) NSInteger  REVERSAL;
@property(nonatomic,assign) NSInteger  TIMES;
@property(nonatomic,assign) NSInteger  EXECUTED;
@property(nonatomic,assign) NSInteger  HIDE;
@property(nonatomic,assign) NSInteger  SEQUENCE_ALL;
@property(nonatomic,assign) NSInteger  SEQUENCE_ROOM;
@property(nonatomic,copy)   NSString * NAME;
@end
