//
//  ACTIONS.m
//  JJControl
//
//  Created by YvanWang on 2018/4/5.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ACTIONS.h"

#import "NSObject+JRDB.h"
@implementation ACTIONS
+ (NSString *)jr_customPrimarykey {
    return @"ID"; // 对应property的属性名
}
/// 自定义主键属性值
- (id)jr_customPrimarykeyValue {
    return self.ID;
}

-(NSString*)insertSqlString{
     UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    
    NSString *sqlAction=[NSString stringWithFormat:@"insert into ACTION(_id,MODULE,moduleId,PARENT,targetID,PARENT2,DELAY,COMMAND1,COMMAND2,CONTENT) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,'%@','%@','%@')",recordTime,_MODULE,_moduleId,_PARENT,_targetID,_PARENT2,_DELAY,_COMMAND1,_COMMAND2,_CONTENT];
    return sqlAction;
}

@end
