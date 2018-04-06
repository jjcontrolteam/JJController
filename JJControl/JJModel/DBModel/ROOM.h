//
//  ROOM.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROOM : NSObject 
@property(nonatomic,assign) NSInteger  TYPE;
@property(nonatomic,assign) NSInteger  FLOOR;
@property(nonatomic,assign) NSInteger  STAR;
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * iconPath;
@property(nonatomic,copy)   NSString * CADMASK;
@property(nonatomic,copy)   NSString * ID;
@end
