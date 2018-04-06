//
//  SCENE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SCENE : NSObject 
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  TYPE; 
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * iconPath;
@property(nonatomic,assign) NSInteger  roomId;
@property(nonatomic,assign) NSInteger  isStop;
@property(nonatomic,assign) NSInteger  HIDE;
@property(nonatomic,assign) NSInteger  SEQUENCE_ALL;
@property(nonatomic,assign) NSInteger  SEQUENCE_ROOM;
@property(nonatomic,assign) NSInteger  SEQUENCE_FLOOR;
@property(nonatomic,copy)   NSString * PASSWORD;
@property(nonatomic,copy)   NSString * VALUE1;
@property(nonatomic,copy)   NSString * ID;
@end
