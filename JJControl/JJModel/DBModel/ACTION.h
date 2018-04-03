//
//  ACTION.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACTION : NSObject 
@property(nonatomic,assign) NSInteger MODULE;
@property(nonatomic,assign) NSInteger MODULE_ID;
@property(nonatomic,assign) NSInteger PARENT;
@property(nonatomic,assign) NSInteger TARGET_ID;
@property(nonatomic,assign) NSInteger PARENT2;
@property(nonatomic,assign) NSInteger DELAY;
@property(nonatomic,copy)   NSString *COMMAND1;
@property(nonatomic,copy) NSString * COMMAND2;
@property(nonatomic,copy) NSString * CONTENT;
@end
