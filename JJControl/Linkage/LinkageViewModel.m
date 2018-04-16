//
//  LinkageViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageViewModel.h"
#import "LinkageModel.h"
#import "LinkageCollectionViewCell.h"
#import "LINKAGE.h"
#import "ACTIONS.h"
#import "TRIGGER.h"
@interface LinkageViewModel(){
    NSMutableArray *_blockArray;
}
@end

@implementation LinkageViewModel

- (instancetype)init{
    if(self = [super init]){
        _blockArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)fetchData:(fetchBlock)block{
   // [_blockArray addObject:@[@"开灯"]];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        LinkageModel *linkage = [[LinkageModel alloc] init];
        linkage.iconPic = @"JJControlResource.bundle/right.png";
        linkage.title = @"红外感应";
        linkage.room = @"二层卫生间";
        linkage.mode = @"立即";
        linkage.state = @"打开";
        linkage.modeArray = @[@"立即",@"1秒",@"2秒",@"3秒"];
        linkage.stateArray = @[@"打开",@"关闭"];
        [array addObject:linkage];
    }
    [_blockArray addObject:array];

    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        LinkageModel *linkage = [[LinkageModel alloc] init];
        linkage.iconPic = @"JJControlResource.bundle/right.png";
        linkage.title = @"电灯";
        linkage.room = @"一层客厅";
        linkage.mode = @"1秒";
        linkage.state = @"关闭";
        linkage.modeArray = @[@"立即",@"1秒",@"2秒",@"3秒"];
        linkage.stateArray = @[@"打开",@"关闭"];
        [array1 addObject:linkage];
    }
   // [_blockArray addObject:array1];
     block(@[@[],array,@[],array1]);
    
}

-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@{@"title":@"联动名称:",@"enter":@""},
            @{@"name":@"如果"},
            @{@"name":@"'或'表示两个或两个以上条件，只要满足其中一项，所以列表中至少有两项为‘或’，请继续添加"},
            @{@"name":@"就"}]);
}

#pragma mark-测试调试使用
-(void)insertLink:(LINKAGE*)link withAction:(ACTIONS*)action withTrrige:(TRIGGER*)trigger callback:(fetchBlock)block{
    link=[[LINKAGE alloc]init];
    link.NAME=@"有人开灯";
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    NSString *sqlLink=[NSString stringWithFormat:@"insert into LINKAGE(_id,PARENT,ROOM_ID,ENABLE,REVERSAL,TIMES,EXECUTED,HIDE,SEQUENCE_ALL,SEQUENCE_ROOM,NAME) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,'%@')", recordTime,link.PARENT,link.roomID,link.ENABLE,link.REVERSAL,link.TIMES,link.EXECUTED,link.HIDE,link.SEQUENCE_ALL,link.SEQUENCE_ROOM,link.NAME];//,\"
    action=[[ACTIONS alloc]init];
    action.MODULE=1;
    action.moduleId=162203570008623;
    action.PARENT=18;
    action.PARENT2=18;
    action.targetID=11652348321409;
    action.COMMAND1=@"打开";
    action.COMMAND2=@"";
    action.CONTENT=@"";
    NSString *sqlAction=[NSString stringWithFormat:@"insert into ACTION(_id,MODULE,moduleId,PARENT,targetID,PARENT2,DELAY,COMMAND1,COMMAND2,CONTENT) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,'%@','%@','%@')",recordTime,action.MODULE,action.moduleId,action.PARENT,action.targetID,action.PARENT2,action.DELAY,action.COMMAND1,action.COMMAND2,action.CONTENT];
    trigger=[[TRIGGER alloc]init];
    trigger.PARENT=18;
    trigger.AND_OR=1;
    trigger.FLAG=1;
    trigger.TYPE=2;
    trigger.REPEAT=127;
    trigger.PARENT2=18;
    trigger.TIME_START=@"";
    trigger.TIME_END=@"";
    NSString *sqlTrigger=[NSString stringWithFormat:@"insert into TRIGGER(_id,LINKAGE_ID,PARENT,AND_OR,FLAG,TYPE,REPEAT,EXECUTED,DEVICE_ID,PARENT2,RANGE,TIME_START,TIME_END) values(%llu,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld,'%@','%@')",recordTime,trigger.LINKAGE_ID,trigger.PARENT,trigger.AND_OR,trigger.FLAG,trigger.TYPE,trigger.REPEAT,trigger.EXECUTED,trigger.DEVICE_ID,trigger.PARENT2,trigger.RANGE,trigger.TIME_START,trigger.TIME_END];
    
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime];
    NSDictionary *dict=@{@"cmd":@"2001",@"session":session,@"id":@"0",@"table":@"LINKAGE",@"sqls":@[sqlLink,sqlTrigger,sqlAction]};
    // __block __weak typeof(self) weakSelf= self;
    //__block LINKAGE *saveLINKAGE=room;
   // saveLINKAGE.ID=[NSString stringWithFormat:@"%llu",recordTime];
    
    [[ServiceMgr share] sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
           // if([saveRoom jr_save]){
                block(@[]);
            //}
        }
    }];
}
-(void)updateCell:(UICollectionViewCell *)cell withData:(id)model
{
    LinkageModel *cellData=(LinkageModel*)model;
    LinkageCollectionViewCell *cellview=(LinkageCollectionViewCell*)cell;
   
        cellview.imgView.hidden = NO;
        cellview.lbLocate.hidden = NO;
        cellview.lbState.hidden = NO;
        cellview.lbModel.hidden = NO;
        
        cellview.imgView.image = [UIImage imageNamed:@"JJControlResource.bundle/right.png"];
        [cellview.lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(cellview.mas_centerY);
            make.left.mas_equalTo(cellview.imgView.mas_right).offset(CELL_INNER_MARGIN);
        }];
        
        cellview.lbName.text = @"红外感应";
        cellview.lbLocate.text = @"二层卫生间";
        cellview.lbModel.text = @"立即";
        cellview.lbState.text = @"打开";
    
        cellview.imgView.hidden = NO;
        cellview.lbLocate.hidden = NO;
        cellview.lbState.hidden = NO;
        cellview.lbModel.hidden = NO;
        
        [cellview.lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(cellview.mas_centerY);
            make.left.mas_equalTo(cellview.imgView.mas_right).offset(CELL_INNER_MARGIN);
        }];
        
        cellview.imgView.image = [UIImage imageNamed:cellData.iconPic];
        cellview.lbName.text = cellData.title;
        cellview.lbLocate.text = cellData.room;
        cellview.lbModel.text = cellData.mode;
        cellview.lbState.text = cellData.state;
        
    
}
- (void)changeDataAtSection:(NSInteger)section row:(NSInteger)row withSelectedRows:(NSArray *)selectedRows{
    LinkageModel *linkageModel = [[_blockArray objectAtIndex:section] objectAtIndex:row];
    for (int i = 0; i < selectedRows.count; i++) {
        NSInteger currentRow = [[selectedRows objectAtIndex:i] integerValue];
        if(i == 0){ //model
            linkageModel.mode = [linkageModel.modeArray objectAtIndex:currentRow];
        }else{
            linkageModel.state = [linkageModel.stateArray objectAtIndex:currentRow];
        }
    }
}


@end
