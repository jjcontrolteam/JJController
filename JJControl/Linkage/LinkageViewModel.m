//
//  LinkageViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageViewModel.h"
#import "LinkageModel.h"

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
    [_blockArray addObject:@[@"开灯"]];

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
    [_blockArray addObject:array1];
    block(_blockArray);
    
}
-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[@{},
            @{@"name":@"如果"},
            @{@"name":@"就"}]);
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
