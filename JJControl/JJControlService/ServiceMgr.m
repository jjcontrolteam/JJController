//
//  ServiceMgr.m
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ServiceMgr.h"
#import "JJServiceInterface.h"

static ServiceMgr * _singleton;

@interface ServiceMgr()<JJServiceDelegate>{
    ReceiveBlock jsonModelBlock_;
    ReceiveBlock sysDataBlock_;
}
@end
@implementation ServiceMgr

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleton==nil) {
            _singleton = [[ServiceMgr alloc] init];
        }
        
    });
    
    return _singleton;
    
}
-(instancetype)init{
    self = [super init];
    if (self) {
        JJServiceInterface *service = [JJServiceInterface share];
        service.delegate = self;
        
    }
    return self;
}

-(void)sendMessage:(NSDictionary*)dict withTopic:(NSString*)topic withResponse:(NSString*)receiveTopic withSuccess:(ReceiveBlock)block{
    if (dict) {
        JJServiceInterface *service = [JJServiceInterface share];
        jsonModelBlock_ = [block copy];
        NSString *str =  [[JJServiceInterface class] jsonStringWithDictionary:dict];
        [service sendMsg:[str dataUsingEncoding:NSUTF8StringEncoding] toTopic:topic receiveTopic:receiveTopic];
    }
    
}

-(void)sysStartingFetchData:(ReceiveBlock)block{
    //
    sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/123456/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/123456/%@/data/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1001",@"tables":@[@{@"table":@"device",@"version":@"1"},@{@"table":@"scene",@"version":@"1"}]};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            [weakSelf sysStartFetchData];
        }
        
    }];
    
}
-(void)sysStartFetchData{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/123456/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/123456/%@/data/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1001"};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            [weakSelf sysEndFetchData];
        }
        
    }];
}

-(void)sysEndFetchData{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/123456/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/123456/%@/data/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1003"};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            [weakSelf callBackSysData:dict];
        }
        
    }];
}
-(void)callBackSysData:(NSDictionary*)dict{
    if (dict) {
        if (sysDataBlock_) {
            sysDataBlock_(dict);
        }
    }
}
- (void)receiveJson:(NSDictionary*)dict
{
    if (dict) {
        if (jsonModelBlock_) {
            jsonModelBlock_(dict);
        }
    }
}
-(void)cleanUp{
    jsonModelBlock_=nil;
    sysDataBlock_=nil;
}
@end
