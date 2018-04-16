//
//  AddLinkCollectionView.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddLinkCollectionView.h"
#import "BaseDataSource.h"
#import "BaseDataDelegate.h"
#import "AddLinkCell.h"
#import "AddLinkReusableView.h"
#import "AddLinkDataDelegate.h"
#import "AddLinkViewModel.h"
static NSString *identifier=@"AddLinkCollectionCell";
static NSString *headerIdentifier=@"AddLinkCollectionReusable";

@interface AddLinkCollectionView(){
    
    BaseDataSource *_dataSource ;
    AddLinkDataDelegate *_delegate;
}
@end

@implementation AddLinkCollectionView


- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor colorWithWhite:0.33333 alpha:1.0]];
    [self registerClass:[AddLinkCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[AddLinkReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    
    _dataSource = [[BaseDataSource alloc]initWithItems:@[]  cellIdentifier:identifier withHeaderItem:@[] headerIdentifier:headerIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[AddLinkDataDelegate alloc]initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    self.isMultiSection = YES;
    
    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel updateCell:cell withData:data];
}

-(void)fetchData1{
    AddLinkViewModel *viewmodel=(AddLinkViewModel*)self.viewModel;
    __block __weak typeof(self) weakSelf=self;
    [viewmodel fetchData1:^(NSArray *data) {
        BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
        BaseDataDelegate *ddd=(AddLinkDataDelegate*)weakSelf.delegate;
        ds.cellData = [NSMutableArray arrayWithArray:data];
        ddd.items = [NSMutableArray arrayWithArray:data];
        [weakSelf reloadData];
    }];
    [viewmodel fetchHeaderData1:^(NSArray *data) {
        BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource; 
        ds.headerData=data;
        [weakSelf reloadData];
    }];
}
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    AddLinkReusableView *header1 = (AddLinkReusableView *)header;
    [header1  setData:data];
}
- (void)chooseCell:(id)data withIndexPath:indexPath{
    NSLog(@"%@",data);
    if(self.cellTappedBlock){
        self.cellTappedBlock(data);
    }
}
@end
