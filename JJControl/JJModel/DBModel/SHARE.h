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
@property(nonatomic,assign) NSInteger  SHARE_ID;
@property(nonatomic,assign) NSInteger  PARENT2;
@property(nonatomic,assign) NSInteger  TO_TYPE;
@property(nonatomic,assign) NSInteger  LIMIT;
@property(nonatomic,copy)   NSString * FROM;
@property(nonatomic,copy)   NSString * TO;
@property(nonatomic,copy)   NSString * START_TIME;
@property(nonatomic,copy)   NSString * END_TIME;
@end
