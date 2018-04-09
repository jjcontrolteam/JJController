//
//  ServiceMgr.m
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ServiceMgr.h"
#import "JJServiceInterface.h"
#import "MBProgressHUD.h"
static ServiceMgr * _singleton;

@interface ServiceMgr()<JJServiceDelegate>{
    ReceiveBlock jsonModelBlock_;
    ReceiveBlock sysDataBlock_;
    ConnectBlock conBlock_;
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
-(void)connectWithClientId:(NSString*)clientid withSuccess:(ConnectBlock)block{
    [self showHud];
    [self showStatus:@"连接中"];
    JJServiceInterface *service = [JJServiceInterface share];
    service.delegate = self;
    conBlock_ = [block copy];
    [service connectWithClientId:clientid];
}

- (void)connectSuccess{
    [self hiddenHud];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (conBlock_) {
            conBlock_(YES);
        }
    });
    
}
-(void)connectFailue{
    [self hiddenHud];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (conBlock_) {
            conBlock_(NO);
        }
    });
    
    
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
    [self showHud];
    [self showStatus:@"同步数据"];
    sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/%@/data/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1001",@"tables":@[]};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"cmd"]&&[[dict objectForKey:@"cmd"]integerValue]==1003) {
            [weakSelf hiddenHud];
            [[JRDBMgr shareInstance]close];
            [weakSelf callBackSysData:dict];
        }else{
            if (dict) {
                [weakSelf sysSaveData:dict];
            }
        }
        
    }];
    
}

-(void)sysSaveData:(NSDictionary*)dict{
    NSString *tbclass=[dict valueForKey:@"table"];
    if (tbclass) {
        if (tbclass) {
            for (NSDictionary *val in [dict valueForKey:@"rows"]) {
                if ([tbclass isEqualToString:@"ACTION"]) {//注意取，写后台表为ACTION
                    tbclass =@"ACTIONS";
                }
                id  tbmodel=[NSClassFromString(tbclass) mj_objectWithKeyValues:val];
                
                if (tbmodel) {
                    [[JRDBMgr shareInstance] registerClazzes:@[NSClassFromString(tbclass)]];
                    [tbmodel jr_save];
                    
                }
                
            }
        }
    }
}

-(void)callBackSysData:(NSDictionary*)dict{
    if (dict) {
        if (sysDataBlock_) {
            sysDataBlock_(dict);
        }
    }
}
#pragma mark-委托返回
- (void)receiveJson:(NSDictionary*)dict
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (dict) {
            if (jsonModelBlock_) {
                jsonModelBlock_(dict);
            }
        }
    });
    
   
}

-(void)cleanUp{
    jsonModelBlock_=nil;
    sysDataBlock_=nil;
}

#pragma mark-ui操作
- (void)showHud{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
        [MBProgressHUD showHUDAddedTo:window animated:YES];
    });
    
}

- (void)hiddenHud{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
        [MBProgressHUD hideHUDForView:window animated:YES];
    });
    
}

- (void)showStatus:(NSString*)msg{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
        MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
        if (hud) {
            [hud.label setText:msg];
        }
    });
    
    
}
#pragma mark-测试调试使用
-(void)insertRoom{//:(ReceiveBlock)block
    // sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    UInt64 recordTime1 = [[NSDate date] timeIntervalSince1970]*1000*1000;
    // NSString *sqlStr=[NSString stringWithFormat:@"[\"insert into ROOM(_id,NAME,TYPE,ICON_PATH,FLOOR,STAR) values(%llu,'AA',2,'icon_fj_kt',1,0)\"]",recordTime];//,\"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,'1F','','')
    NSString *sqlRoom=[NSString stringWithFormat:@"insert into ROOM(_id,NAME,TYPE,ICON_PATH,FLOOR,STAR) values(%llu,'房间53',2,'icon_fj_kt',1,0)",recordTime];//,\"
    NSString *sqlFloor=[NSString stringWithFormat:@"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,1,'1F','')",recordTime];;
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime1];
    NSDictionary *dict=@{@"cmd":@"2001",@"session":session,@"id":@"0",@"table":@"ROOM",@"sqls":@[sqlRoom,sqlFloor]};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
            [weakSelf callBackSysData:dict];
        }
    }];
}
-(void)deleteRoom{//:(ReceiveBlock)block
    // sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    UInt64 recordTime1 = [[NSDate date] timeIntervalSince1970]*1000*1000;
    // NSString *sqlStr=[NSString stringWithFormat:@"[\"insert into ROOM(_id,NAME,TYPE,ICON_PATH,FLOOR,STAR) values(%llu,'AA',2,'icon_fj_kt',1,0)\"]",recordTime];//,\"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,'1F','','')
    NSString *sqlRoom=[NSString stringWithFormat:@"delete from ROOM where _id=%@",@"1523006595479821"];//,\"
    NSString *sqlFloor=[NSString stringWithFormat:@"delete from FLOOR where _id=%@",@"1523006595479821"];;
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime1];
    NSDictionary *dict=@{@"cmd":@"2003",@"session":session,@"id":@"0",@"table":@"ROOM",@"sqls":@[sqlRoom,sqlFloor]};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
            [weakSelf callBackSysData:dict];
        }
    }];
}
-(void)bindCentral:(ReceiveBlock)block{
    sysDataBlock_ = [block copy];
    
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=@"v1/cloud/request";
    NSString *receive=[NSString stringWithFormat:@"v1/cloud/%@/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1006",@"user":clientid,@"central":@"18"};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            if ([dict objectForKey:@"cmd"]&&[[dict objectForKey:@"cmd"]integerValue]==1006
                ) {
                [weakSelf bindCentraling];
            }
            
        }
        
    }];
}
-(void)bindCentraling{
    
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=@"v1/cloud/request";
    NSString *receive=[NSString stringWithFormat:@"v1/cloud/%@/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1005",@"user":clientid,@"central":@"18"};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            if ([dict objectForKey:@"cmd"]&&[[dict objectForKey:@"cmd"]integerValue]==1005
                ) {
                [weakSelf callBackSysData:dict];
            }
            
        }
        
    }];
}

-(void)fetchUserInfo{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=@"v1/cloud/request";//[NSString stringWithFormat:@"v1/cloud/%@/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/cloud/%@/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1008",@"user":clientid};
    __block __weak typeof(self) weakSelf= self;
    [self sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            if ([dict objectForKey:@"cmd"]&&[[dict objectForKey:@"cmd"]integerValue]==1003) {
                [weakSelf callBackSysData:dict];
            }
            
        }
        
    }];
    
}
@end
