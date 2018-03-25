//
//  SettingViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingViewModel.h"

@implementation SettingViewModel
-(void)fetchData:(fetchBlock)block{
    block(@[@"信息",@"span", @"消息", @"摇一摇", @"span", @"设备", @"密码", @"通用", @"反馈"]);
}
@end
