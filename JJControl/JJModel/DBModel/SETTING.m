//
//  SETTING.m
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SETTING.h"
#import "NSObject+JRDB.h"
@implementation SETTING
+ (NSString *)jr_customPrimarykey {

    return @"ID"; // 对应property的属性名
}
/// 自定义主键属性值
- (id)jr_customPrimarykeyValue {
    return self.ID;
}
@end
