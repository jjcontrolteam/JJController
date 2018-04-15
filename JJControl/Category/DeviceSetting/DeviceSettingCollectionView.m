//
//  DeviceSettingCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingCollectionView.h"
#import "DeviceSettingDataDelegate.h"
#import "DeviceSettingCollectionViewCell.h"
#import "DeviceSettingDataSource.h"
#import "SpanCollectionViewCell.h"
#import "ButtonCollectionViewCell.h"

@interface DeviceSettingCollectionView(){
    DeviceSettingDataSource *_dataSource;
    DeviceSettingDataDelegate *_delegate;
}

@end

@implementation DeviceSettingCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
     
    [self setBackgroundColor:[UIColor lightGrayColor]];
    [self registerClass:[DeviceSettingCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[SpanCollectionViewCell class] forCellWithReuseIdentifier:spanIdentifier];
    [self registerClass:[ButtonCollectionViewCell class] forCellWithReuseIdentifier:buttonIdentifier];

    _dataSource = [[DeviceSettingDataSource alloc] initWithItems:@[] cellIdentifier:identifier  andCellBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[DeviceSettingDataDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel updateCell:cell withData:data];
}

- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{
    if(self.block){
        self.block(data);
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
