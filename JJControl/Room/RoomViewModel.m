//
//  RoomViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomViewModel.h"
#import "ServiceMgr.h"
#import "ROOM.h"
#import "RoomCollectionCell.h"

@interface RoomViewModel(){
    NSArray<ROOM *> *_floors;
}
@end

@implementation RoomViewModel

-(void)fetchData:(fetchBlock)block{
    // 分组按照楼层
    _floors=J_Select(ROOM)
                            .GroupJ(FLOOR)
                            .list;
    NSMutableArray *arr=[NSMutableArray array];
    [arr addObject:@[@"轮播"]];
    for (ROOM *room in _floors) {
        NSArray<ROOM *> *list =J_Select(ROOM).AndJ(FLOOR).eq([NSNumber numberWithInteger:room.FLOOR])
                                .list;
        if(list.count > 0){
            [arr addObject:list];
        }
    }
    block(arr);
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

- (void)fetchHeaderData:(fetchBlock)block{
    NSMutableArray *arr=[NSMutableArray array];
    [arr addObject:@""];
    for (ROOM *room in _floors) {
        if(room.NAME)
            [arr addObject:[NSString stringWithFormat:@"F%@",@(room.FLOOR)]];
    }
    block(arr);
}

- (void)fetchConectData:(fetchBlock)block{
    block(@[@""]);
}


#pragma mark-测试调试使用
-(void)insertRoom:(fetchBlock)block{
    // sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    UInt64 recordTime1 = [[NSDate date] timeIntervalSince1970]*1000*1000;
    
    NSString *sqlRoom=[NSString stringWithFormat:@"insert into ROOM(_id,NAME,TYPE,ICON_PATH,FLOOR,STAR) values(%llu,'房间53',2,'icon_fj_kt',1,0)",recordTime];//,\"
    NSString *sqlFloor=[NSString stringWithFormat:@"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,1,'1F','')",recordTime];;
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime1];
    NSDictionary *dict=@{@"cmd":@"2001",@"session":session,@"id":@"0",@"table":@"ROOM",@"sqls":@[sqlRoom,sqlFloor]};
   // __block __weak typeof(self) weakSelf= self;
    [[ServiceMgr share] sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
            block(@[@""]);
        }
    }];
}
-(void)deleteRoom{//:(ReceiveBlock)block
    // sysDataBlock_ = [block copy];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    //UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    UInt64 recordTime1 = [[NSDate date] timeIntervalSince1970]*1000*1000;
    
    NSString *sqlRoom=[NSString stringWithFormat:@"delete from ROOM where _id=%@",@"1523006595479821"];//,\"
    NSString *sqlFloor=[NSString stringWithFormat:@"delete from FLOOR where _id=%@",@"1523006595479821"];;
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime1];
    NSDictionary *dict=@{@"cmd":@"2003",@"session":session,@"id":@"0",@"table":@"ROOM",@"sqls":@[sqlRoom,sqlFloor]};
    __block __weak typeof(self) weakSelf= self;
    [[ServiceMgr share] sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
            [weakSelf updateCollectionView];
        }
    }];
}
@end
