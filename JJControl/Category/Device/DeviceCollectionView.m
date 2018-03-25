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
    [super buildUI:myDataSourceBlock withHeaderBlock:headerBlock withFooterBlock:footerBlock withDelegate:myDataSourceBlock];
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[DeviceCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[DeviceCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:usableIdentifier];

    _dataSource = [[BaseDataSource alloc] initWithItems:self.items cellIdentifier:identifier withHeaderItem:@{@"":@""} headerIdentifier:usableIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceDataDelegate alloc] initWithItems:self.items andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    DeviceCollectionViewCell *newCell = (DeviceCollectionViewCell *)cell;

    [newCell setData:data];
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    DeviceCollectionReusableView *headerView = (DeviceCollectionReusableView *)header;
    headerView.segmentChangedBlock = ^(NSInteger index) {
        if(index == 0){
            __block typeof(self) weakSelf=self;
            [self.viewModel fetchData:^(NSArray *data) {
                weakSelf.items = [NSMutableArray arrayWithArray:data];
            }];
        }else{
            DeviceViewModel *vModel=(DeviceViewModel*)self.viewModel;
            __block typeof(self) weakSelf=self;
            [vModel fetchData1:^(NSArray *data) {
                weakSelf.items = [NSMutableArray arrayWithArray:data];
            }];
        }
        [self reloadData];
    };
}

- (void)chooseCell:(id)data{
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
