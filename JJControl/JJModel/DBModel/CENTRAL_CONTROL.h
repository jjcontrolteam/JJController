//
//  CENTRAL_CONTROL.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CENTRAL_CONTROL : NSObject
@property(nonatomic,assign) NSInteger  _id;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,assign) NSInteger  CHANNEL;
@property(nonatomic,copy)   NSString * NAME;
@property(nonatomic,copy)   NSString * TYPE;
@property(nonatomic,assign) NSInteger  VERSION;
@property(nonatomic,assign) NSInteger  SIGN_LIGHT;
@property(nonatomic,copy)   NSString * HOST;
@property(nonatomic,assign) NSInteger  BAUD_RATE;
@end
