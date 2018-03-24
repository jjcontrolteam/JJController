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
#import "DeviceModel.h"

static NSString *identifier = @"DeviceCollectionCell";
static NSString *usableIdentifier = @"DeviceCollectionReusableView";

@interface DeviceCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}

@property (nonatomic, strong) NSMutableArray *array1;
@property (nonatomic, strong) NSMutableArray *array2;

@end

@implementation DeviceCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[DeviceCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[DeviceCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:usableIdentifier];

    _dataSource = [[BaseDataSource alloc] initWithItems:self.array1 cellIdentifier:identifier withHeaderItem:@{@"":@""} headerIdentifier:usableIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceDataDelegate alloc] initWithItems:self.array1 andCallBack:myDelegateBlock];
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
            [_dataSource setItems:self.array1];
            [_delegate setItems:self.array1];
        }else{
            
            [_dataSource setItems:self.array2];
            [_delegate setItems:self.array2];
        }
        [self reloadData];
    };
}

- (void)chooseCell:(id)data{
    if(self.block){
        self.block();
    }
}

- (NSMutableArray *)array1{
    if (!_array1) {
        _array1 = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 15; i++) {
            NSString *title = [NSString stringWithFormat:@"灯光 %@", @(i)];
            DeviceModel *model = [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title isOn:YES];
            [_array1 addObject:model];
        }
    }
    return _array1;
}

- (NSMutableArray *)array2{
    if (!_array2) {
        _array2 = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 10; i++) {
            NSString *title = [NSString stringWithFormat:@"新的 %@", @(i)];
            DeviceModel *model = [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title isOn:YES];
            [_array2 addObject:model];
        }
    }
    return _array2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
