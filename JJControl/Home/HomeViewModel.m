//
//  HomeViewModel.m
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeViewModel.h"
#import "DEVICE.h"
#import "SCENE.h"
#import "LINKAGE.h"
@interface HomeViewModel(){
   
}
@end
@implementation HomeViewModel

-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@"JJControlResource.bundle/room_image_0.jpg"]);
}
-(void)fetchData:(fetchBlock)block{
    // 分组按照楼层
    NSArray<DEVICE*> *_devices=J_Select(DEVICE).OrderJ(ENABLE).Descend.list;
    
    block(_devices);
}
-(void)fetchScene:(fetchBlock)block{
    // 分组按照楼层
    NSArray<SCENE*> *_scenes=J_Select(SCENE).OrderJ(isStop).Descend.list;
    
    block(_scenes);
}

-(void)fetchLinkAge:(fetchBlock)block{
    // 分组按照楼层
    NSArray<LINKAGE*> *links=J_Select(LINKAGE).GroupJ(NAME).OrderJ(ENABLE).Descend.list;
    
    block(links);
}
@end
