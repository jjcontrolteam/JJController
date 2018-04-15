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
@implementation AddLinkViewModel

-(void)fetchData:(fetchBlock)block{
  //  NSArray<DEVICE*> *list=J_Select(DEVICE).WhereJ(TYPE).
    NSMutableArray *arr=[NSMutableArray array];
    AddLinkModel *linkModel=[[AddLinkModel alloc]init];
    linkModel.iconPath=@"";
    linkModel.txt=@"App";
    [arr addObject:linkModel];
    
    NSMutableArray *arr1=[NSMutableArray array];
    AddLinkModel *linkModel1=[[AddLinkModel alloc]init];
    linkModel1.iconPath=@"";
    linkModel1.txt=@"人体传感器B1-18";
    [arr1 addObject:linkModel1];
    
    block(@[arr,arr1]);
    
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
@end
