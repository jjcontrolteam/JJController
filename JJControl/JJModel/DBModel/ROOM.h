//
//  ROOM.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROOM : NSObject
@property(nonatomic,assign) NSInteger  _id;
@property(nonatomic,assign) NSInteger  TYPE;
@property(nonatomic,assign) NSInteger  FLOOR;
@property(nonatomic,assign) NSInteger  STAR;
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * ICON_PATH;
@property(nonatomic,copy)   NSString * CAD_MASK;
@end
