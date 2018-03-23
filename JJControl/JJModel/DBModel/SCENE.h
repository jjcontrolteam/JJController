//
//  SCENE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SCENE : NSObject
@property(nonatomic,assign) NSInteger  _id;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  TYPE; 
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * ICON_PATH;
@property(nonatomic,assign) NSInteger  ROOM_ID;
@property(nonatomic,assign) NSInteger  HIDE;
@property(nonatomic,assign) NSInteger  SEQUENCE_ALL;
@property(nonatomic,assign) NSInteger  SEQUENCE_ROOM;
@property(nonatomic,assign) NSInteger  SEQUENCE_FLOOR;
@property(nonatomic,copy)   NSString * PASSWORD;
@end
