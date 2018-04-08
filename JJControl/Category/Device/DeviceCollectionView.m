//
//  DeviceCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceCollectionView.h"
#import "DeviceDataDelegate.h"
#import "DeviceCollectionViewCell.h"
#import "DeviceCollectionReusableView.h"
#import "BaseDataSource.h"
#import "DeviceViewModel.h"

static NSString *identifier = @"DeviceCollectionCell";
static NSString *usableIdentifier = @"DeviceCollectionReusableView";

@interface DeviceCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}


@end

@implementation DeviceCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self registerClass:[DeviceCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[DeviceCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:usableIdentifier];

    _dataSource = [[BaseDataSource alloc] initWithItems:@[] cellIdentifier:identifier withHeaderItem:@[] headerIdentifier:usableIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceDataDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    DeviceCollectionViewCell *newCell = (DeviceCollectionViewCell *)cell;

    [newCell setData:data];
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    DeviceCollectionReusableView *headerView = (DeviceCollectionReusableView *)header;
    [headerView setCellData:data];
    headerView.segmentChangedBlock = ^(NSInteger index) {
        if(index == 0){
            __block __weak typeof(self) weakSelf=self;
            [self.viewModel fetchData:^(NSArray *data) {
                BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
                DeviceDataDelegate *ddd=(DeviceDataDelegate*)weakSelf.delegate;
                ds.cellData = [NSMutableArray arrayWithArray:data];
                ddd.items = [NSMutableArray arrayWithArray:data];
                [weakSelf reloadData];
            }];
        }else{
            DeviceViewModel *vModel=(DeviceViewModel*)self.viewModel;
            __block __weak typeof(self) weakSelf=self;
            [vModel fetchData1:^(NSArray *data) {
                BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
                DeviceDataDelegate *ddd=(DeviceDataDelegate*)weakSelf.delegate;
                ds.cellData = [NSMutableArray arrayWithArray:data];
                ddd.items = [NSMutableArray arrayWithArray:data];
                [weakSelf reloadData];
            }];
        }
    };
}

- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{
    if(self.block){
        self.block();
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
