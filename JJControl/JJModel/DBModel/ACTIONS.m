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
@end
