//
//  ACTION.h
//  JJControl
//
//  Created by admin on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACTION : NSObject
@property(nonatomic,assign) NSInteger MODULE;
@property(nonatomic,assign) NSInteger moduleId;
@property(nonatomic,assign) NSInteger PARENT;
@property(nonatomic,assign) NSInteger targetID;
@property(nonatomic,assign) NSInteger PARENT2;
@property(nonatomic,assign) NSInteger DELAY;
@property(nonatomic,copy)   NSString *COMMAND1;
@property(nonatomic,copy) NSString * COMMAND2;
@property(nonatomic,copy) NSString * CONTENT;
@property(nonatomic,copy)   NSString * ID;
@end
