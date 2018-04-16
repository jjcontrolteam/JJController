//
//  _m
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TRIGGER.h"

@implementation TRIGGER
-(NSString*)insertSqlString{
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    NSString *sqlTrigger=[NSString stringWithFormat:@"insert into TRIGGER(_id,LINKAGE_ID,PARENT,AND_OR,FLAG,TYPE,REPEAT,EXECUTED,DEVICE_ID,PARENT2,RANGE,TIME_START,TIME_END) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,'%@','%@')",recordTime,(long)_LINKAGE_ID,_PARENT,_AND_OR,_FLAG,_TYPE,_REPEAT,_EXECUTED,_DEVICE_ID,_PARENT2,_RANGE,_TIME_START,_TIME_END];

    return sqlTrigger;
}


@end
