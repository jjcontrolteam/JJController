//
//  COMMAND.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface COMMAND : NSObject 
@property(nonatomic,assign) NSInteger  DEVICE_ID;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,copy)   NSString * CMD;
@property(nonatomic,assign) NSInteger  IS_FEEDBACK;
@end
