//
//  SHARE.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SHARE : NSObject 
@property(nonatomic,assign) NSInteger  TYPE;
@property(nonatomic,assign) NSInteger  shareId;
@property(nonatomic,assign) NSInteger  PARENT2;
@property(nonatomic,assign) NSInteger  toType;
@property(nonatomic,assign) NSInteger  LIMIT;
@property(nonatomic,copy)   NSString * FROM;
@property(nonatomic,copy)   NSString * TO;
@property(nonatomic,copy)   NSString * startTime;
@property(nonatomic,copy)   NSString * endTime;
@property(nonatomic,copy)   NSString * ID;
@end
