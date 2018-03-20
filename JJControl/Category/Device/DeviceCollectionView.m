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
@end

@implementation DeviceCollectionView

- (void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[DeviceCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[DeviceCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:usableIdentifier];

    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 15; i++) {
        NSString *title = [NSString stringWithFormat:@"灯光 %@", @(i)];
        DeviceModel *model = [DeviceModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title isOn:YES];
        [array addObject:model];
    }
    _dataSource = [[BaseDataSource alloc] initWithItems:array cellIdentifier:identifier headerIdentifier:usableIdentifier footerIdentifier:nil andCallBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceDataDelegate alloc] initWithItems:array andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
}

- (void)bindCell:(id)cell withData:(id)data{
    DeviceCollectionViewCell *newCell = (DeviceCollectionViewCell *)cell;
    [newCell setData:data];
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
