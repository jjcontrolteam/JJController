//
//  ServiceMgr.h
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ReceiveBlock)(NSDictionary *dict);
typedef void(^ConnectBlock)(BOOL success);
@interface ServiceMgr : NSObject
+ (instancetype)share;
-(void)bindCentral:(ReceiveBlock)block;
-(void)sendMessage:(NSDictionary*)dict withTopic:(NSString*)topic withResponse:(NSString*)receiveTopic withSuccess:(ReceiveBlock)block;
-(void)connectWithClientId:(NSString*)clientid withSuccess:(ConnectBlock)block;
-(void)cleanUp;
-(void)sysStartingFetchData:(ReceiveBlock)block;
-(void)insertRoom;
-(void)deleteRoom;
-(void)fetchUserInfo;
@end
