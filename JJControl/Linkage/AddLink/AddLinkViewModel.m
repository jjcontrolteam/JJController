//
//  AddLinkViewModel.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddLinkViewModel.h"
#import "AddLinkCell.h"
#import "AddLinkModel.h"
#import "DEVICE.h"
#import "SCENE.h"
@implementation AddLinkViewModel

-(void)fetchData:(fetchBlock)block{
    NSArray<DEVICE*> *list=J_Select(DEVICE).WhereJ(TYPE=700 and ENABLE=1).list;
    NSMutableArray *arr=[NSMutableArray array];
    AddLinkModel *linkModel=[[AddLinkModel alloc]init];
    linkModel.iconPath=@"timer";
    linkModel.txt=@"时间";
    [arr addObject:linkModel];
    
    NSMutableArray *arr1=[NSMutableArray array];
    for (DEVICE *device in list) {
        AddLinkModel *linkModel1=[[AddLinkModel alloc]init];
        linkModel1.iconPath=device.iconPath;
        linkModel1.txt=device.NAME;
        [arr1 addObject:linkModel1];
    }
    
    block(@[arr,arr1]);
    
}

-(void)fetchData1:(fetchBlock)block{
    NSArray<DEVICE*> *list=J_Select(DEVICE).WhereJ(ENABLE=1).list;
    NSArray<SCENE*> *scens=J_Select(SCENE).WhereJ(isStop=1).list;
    NSMutableArray *arr=[NSMutableArray array];
    AddLinkModel *linkModel=[[AddLinkModel alloc]init];
    linkModel.iconPath=@"icon_app";
    linkModel.txt=@"App";
    AddLinkModel *linkModel1=[[AddLinkModel alloc]init];
    linkModel1.iconPath=@"icon_app";
    linkModel1.txt=@"Email";
    
    [arr addObject:linkModel];
    [arr addObject:linkModel1];
    
    NSMutableArray *arr1=[NSMutableArray array];
    for (DEVICE *device in list) {
        AddLinkModel *linkModel1=[[AddLinkModel alloc]init];
        linkModel1.iconPath=device.iconPath;
        linkModel1.txt=device.NAME;
        [arr1 addObject:linkModel1];
    }
    NSMutableArray *arr2=[NSMutableArray array];
    for (SCENE *scen in scens) {
        AddLinkModel *linkModel1=[[AddLinkModel alloc]init];
        linkModel1.iconPath=scen.iconPath;
        linkModel1.txt=scen.NAME;
        [arr2 addObject:linkModel1];
    }
    
    block(@[arr,arr2,arr1]);
    
}
- (void)updateCell:(UICollectionViewCell *)cell withData:(id)model{
    AddLinkModel *cellData=(AddLinkModel*)model;
    AddLinkCell*cellview=(AddLinkCell*)cell;
    NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",cellData.iconPath];
    [cellview.imgView setImage:[UIImage imageNamed:imgname]];
    [cellview.textLabel setText:cellData.txt];
}
-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@{@"name":@"系统时间"},
            @{@"name":@"传感器"}]);
}

-(void)fetchHeaderData1:(fetchHeaderBlock)block{
    block(@[@{@"name":@"系统消息"},
            @{@"name":@"全部场景"},@{@"name":@"全部设备"}]);
}
@end
