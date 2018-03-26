//
//  RoomViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomViewModel.h"
#import "ServiceMgr.h"
@implementation RoomViewModel

-(void)fetchData:(fetchBlock)block{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/central_id/%@/control",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/central_id/%@/control/response",clientid];
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"1001",@"cmd",@"123456",@"id",@"1",@"action", nil];
    [[ServiceMgr share]sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        
    }];
}

-(void)fetchSceneData:(fetchBlock)block{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/central_id/%@/control",clientid];
    [[ServiceMgr share]sendMessage:@{} withTopic:topic withResponse:@"" withSuccess:^(NSDictionary *dict) {
        
    }];
}

-(void)fetchDeviceData:(fetchBlock)block{
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/central_id/%@/control",clientid];
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"1001",@"cmd",@"123456",@"id",@"1",@"action", nil];
    [[ServiceMgr share]sendMessage:dict withTopic:topic withResponse:@"" withSuccess:^(NSDictionary *dict) {
        
    }];
}

-(void)fetchConectData:(fetchBlock)block{
    
}
@end
