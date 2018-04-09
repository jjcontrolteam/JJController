//
//  HomeViewModel.m
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel
-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@"JJControlResource.bundle/room_image_0.jpg"]);
}
-(void)fetchData:(fetchBlock)block{
    NSArray *arr=@[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"];
    block(arr);
}
@end
