//
//  LOG_TABLE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LOG_TABLE : NSObject 
@property(nonatomic,assign) NSInteger  TIME;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  MODE;
@property(nonatomic,assign) NSInteger  MODE_ID;
@property(nonatomic,copy)   NSString * USER;
@property(nonatomic,copy)   NSString * CONTENT;
@end
