//
//  RoomCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionView.h"
#import "RoomDataSource.h"
#import "RoomViewModel.h"
#import "RoomDataDelegate.h"
#import "RoomCollectionCell.h"
#import "FloorCollectionReusable.h"
#import "BannerCollectionViewCell.h"

@interface RoomCollectionView(){
    BaseDataSource *_dataSource ;
    BaseDataDelegate *_delegate;
}
@end
@implementation RoomCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor colorWithWhite:0.33333 alpha:1.0]];
    [self registerClass:[RoomCollectionCell class] forCellWithReuseIdentifier:indentifer];
    [self registerClass:[BannerCollectionViewCell class] forCellWithReuseIdentifier:bannerCollectionViewCell];
    [self registerClass:[FloorCollectionReusable class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:floorReusableindentifer];
    
    _dataSource = [[RoomDataSource alloc]initWithItems:@[]  cellIdentifier:indentifer withHeaderItem:@[] headerIdentifier:floorReusableindentifer andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
     self.dataSource = _dataSource;
    
     _delegate = [[RoomDataDelegate alloc]initWithItems:@[] andCallBack:myDelegateBlock];
     self.delegate = _delegate;
    
    self.isMultiSection = YES;

    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel updateCell:cell withData:data];
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
    FloorCollectionReusable *header1 = (FloorCollectionReusable *)header;
    [self.viewModel updateHeaderOrFooter:header1 withData:data];
    
    //    if ([header isKindOfClass:[RoomCollectionReusable class]]) {
//        RoomCollectionReusable *headerView = (RoomCollectionReusable *)header;
//        headerView.segmentChangedBlock = ^(NSInteger index) {
//            RoomViewModel *vModel = (RoomViewModel*)self.viewModel;
//            if(index == 0){
//                __block __weak typeof(self) weakSelf=self;
//                [vModel fetchDeviceData:^(NSArray *data) {
//                    BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
//                    BaseDataDelegate *ddd=(BaseDataDelegate*)weakSelf.delegate;
//                    ds.cellData = [NSMutableArray arrayWithArray:data];
//                    ddd.items = [NSMutableArray arrayWithArray:data];
//                    [weakSelf reloadData];
//                }];
//            }else if(index == 1){
//                __block __weak typeof(self) weakSelf=self;
//                [vModel fetchSceneData:^(NSArray *data) {
//                    BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
//                    BaseDataDelegate *ddd=(BaseDataDelegate*)weakSelf.delegate;
//                    ds.cellData = [NSMutableArray arrayWithArray:data];
//                    ddd.items = [NSMutableArray arrayWithArray:data];
//                    [weakSelf reloadData];
//                }];
//            }else{
//                __block __weak typeof(self) weakSelf=self;
//                [vModel fetchConectData:^(NSArray *data) {
//                    BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
//                    BaseDataDelegate *ddd=(BaseDataDelegate*)weakSelf.delegate;
//                    ds.cellData = [NSMutableArray arrayWithArray:data];
//                    ddd.items = [NSMutableArray arrayWithArray:data];
//                    [weakSelf reloadData];
//                }];
//            }
//
//        };
//    }
    
    
}
- (void)chooseCell:(id)data withIndexPath:indexPath{
    NSLog(@"%@",data);
}
@end
