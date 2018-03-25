//
//  DeviceViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceViewModel.h"
#import "DeviceModel.h"
@implementation DeviceViewModel
 
-(void)fetchData:(fetchBlock)block{
    NSMutableArray *_array1 = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 15; i++) {
        NSString *title = [NSString stringWithFormat:@"灯光 %@", @(i)];
        DeviceModel *model = [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title isOn:YES];
        [_array1 addObject:model];
    }
    block(_array1);
}

-(void)fetchData1:(fetchBlock)block{
    NSMutableArray *_array2 = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 10; i++) {
        NSString *title = [NSString stringWithFormat:@"新的 %@", @(i)];
        DeviceModel *model = [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title isOn:YES];
        [_array2 addObject:model];
    }
    block(_array2);
}


@end
