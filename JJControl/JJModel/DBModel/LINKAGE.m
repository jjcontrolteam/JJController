//
//  LINKAGE.m
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LINKAGE.h"

@implementation LINKAGE
-(NSString*)insertSqlString{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    NSString *sqlLink=[NSString stringWithFormat:@"insert into LINKAGE(_id,PARENT,ROOM_ID,ENABLE,REVERSAL,TIMES,EXECUTED,HIDE,SEQUENCE_ALL,SEQUENCE_ROOM,NAME) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,'%@')", recordTime,_PARENT,_roomID,_ENABLE,_REVERSAL,_TIMES,_EXECUTED,_HIDE,_SEQUENCE_ALL,_SEQUENCE_ROOM,_NAME];//,\"
    return sqlLink;
}
@end
