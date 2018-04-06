//
//  ACTION.m
//  JJControl
//
//  Created by admin on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ACTION.h"
#import "NSObject+JRDB.h"
@implementation ACTION
+ (NSString *)jr_customPrimarykey {
    return @"ID"; // 对应property的属性名
}
/// 自定义主键属性值
- (id)jr_customPrimarykeyValue {
    return self.ID;
}
@end
