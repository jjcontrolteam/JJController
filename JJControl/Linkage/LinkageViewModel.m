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
    /*[_blockArray addObject:@[@"开灯"]];
    
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
    [_blockArray addObject:array1];*/
    block(@[@[@""],@[],@[],@[]]);
    
}

-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@{},
            @{@"name":@"如果"},
            @{@"name":@"'或'表示两个或两个以上条件，只要满足其中一项，所以列表中至少有两项为‘或’，请继续添加"},
            @{@"name":@"就"}]);
}

#pragma mark-测试调试使用
-(void)insertRoom:(LINKAGE*)room callback:(fetchBlock)block{
    // sysDataBlock_ = [block copy];
    /*NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=[NSString stringWithFormat:@"v1/18/%@/data/request",clientid];
    NSString *receive=[NSString stringWithFormat:@"v1/18/all/data/response"];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000*1000;
    UInt64 recordTime1 = [[NSDate date] timeIntervalSince1970]*1000*1000;
    
    NSString *sqlRoom=[NSString stringWithFormat:@"insert into ROOM(_id,NAME,TYPE,ICON_PATH,FLOOR,STAR) values(%llu,'%@',%ld,'%@',%ld,%ld)", recordTime,room.NAME,room.TYPE,room.iconPath,room.FLOOR,room.STAR];//,\"
    NSString *sqlFloor=[NSString stringWithFormat:@"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,%ld,'%ldF','')",recordTime,room.FLOOR,room.FLOOR];
    if (room.FLOOR==-100) {
        sqlFloor=[NSString stringWithFormat:@"insert into FLOOR(_id,FLOOR,NAME,CAD_PATH) values(%llu,%ld,'%@','')",recordTime,room.FLOOR,@"未设"];
    }
    NSString *session=[NSString stringWithFormat:@"%llu",recordTime1];
    NSDictionary *dict=@{@"cmd":@"2001",@"session":session,@"id":@"0",@"table":@"ROOM",@"sqls":@[sqlRoom,sqlFloor]};
    // __block __weak typeof(self) weakSelf= self;
    __block ROOM *saveRoom=room;
    room.ID=[NSString stringWithFormat:@"%llu",recordTime];
    
    [[ServiceMgr share] sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0)  {
            if([saveRoom jr_save]){
                block(@[]);
            }
        }
    }];*/
}
-(void)updateCell:(UICollectionViewCell *)cell withData:(id)model
{
    LinkageModel *cellData=(LinkageModel*)model;
    LinkageCollectionViewCell *cellview=(LinkageCollectionViewCell*)cell;
    if([cellData isKindOfClass:[NSString class]]){
        //联动名称:cellData
        cellview.imgView.hidden = YES;
        
        cellview.lbLocate.hidden = YES;
        cellview.lbState.hidden = YES;
        cellview.lbModel.hidden = YES;
        [cellview.lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cellview.contentView).offset(CELL_TOP_MARGIN);
            make.bottom.mas_equalTo(cellview.contentView).offset(-CELL_BOTTOM_MARGIN);
            make.left.mas_equalTo(cellview.contentView).offset(CELL_LEFT_MARGIN);
        }];
        [cellview.lbNameField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cellview.contentView).offset(0);
            make.bottom.mas_equalTo(cellview.contentView).offset(-0);
            make.left.mas_equalTo(cellview.contentView).offset(100);
        }];
        cellview.lbName.text = @"联动名称:";
        cellview.lbNameField.text=(NSString*)cellData;
    }else{
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
        
        LinkageModel *model = cellData;
        cellview.imgView.hidden = NO;
        cellview.lbLocate.hidden = NO;
        cellview.lbState.hidden = NO;
        cellview.lbModel.hidden = NO;
        
        [cellview.lbName mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(cellview.mas_centerY);
            make.left.mas_equalTo(cellview.imgView.mas_right).offset(CELL_INNER_MARGIN);
        }];
        
        cellview.imgView.image = [UIImage imageNamed:model.iconPic];
        cellview.lbName.text = model.title;
        cellview.lbLocate.text = model.room;
        cellview.lbModel.text = model.mode;
        cellview.lbState.text = model.state;
        
    }
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
