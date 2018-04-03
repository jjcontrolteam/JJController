//
//  BIND.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIND : NSObject 
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  TYPE;
@property(nonatomic,assign) NSInteger  CLICK;
@property(nonatomic,assign) NSInteger  BIND_ID;
@property(nonatomic,assign) NSInteger  PARENT2;
@property(nonatomic,assign) NSInteger  COMMAND1;
@property(nonatomic,copy) NSString * KEY;
@property(nonatomic,assign) NSInteger  COMMAND2;
@end
