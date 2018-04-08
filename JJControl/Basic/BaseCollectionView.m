//
//  BaseCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"
#import "BaseDataSource.h"
#import "BaseDataDelegate.h"
@interface BaseCollectionView()
{
    
}
@property (nonatomic, strong, readwrite) BaseViewModel *viewModel;

@end
@implementation BaseCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout withViewModel:(BaseViewModel*)vModel{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
         __block __weak typeof(self) weakSelf=self;
        void (^myDataSourceBlock)(id cell , id data,NSIndexPath *indexPath) = ^(id cell ,id data,NSIndexPath *indexPath){
            //cell数据的填充方法
            [weakSelf bindCell:cell withData:data withIndexPath:indexPath];
        };
        void (^myFooterBlock)(id footer , id data,NSIndexPath *indexPath) = ^(id footer ,id data,NSIndexPath *indexPath){
            //cell数据的填充方法
            [weakSelf bindFooterer:footer withData:data withIndexPath:indexPath];
        };
        void (^myHeadererBlock)(id header , id data,NSIndexPath *indexPath) = ^(id header ,id data,NSIndexPath *indexPath){
            //cell数据的填充方法
            [weakSelf bindHeader:header withData:data withIndexPath:indexPath];
        };
        void (^myDelegateBlock)(id data, NSIndexPath *indexPath) = ^(id data ,NSIndexPath *indexPath){
            //cell数据的填充方法
            [weakSelf chooseCell:data withIndexPath:indexPath];
        };
        _viewModel = vModel;
       
        //放最后，由于延迟加载数据
        [self buildUI:myDataSourceBlock withHeaderBlock:myHeadererBlock withFooterBlock:myFooterBlock withDelegate:myDelegateBlock];
    }
    return self;
}

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
     
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
}
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
}
- (void)bindFooterer:(id)footer withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
}
-(void)fetchData{
    __block __weak typeof(self) weakSelf= self;
    [self.viewModel fetchData:^(NSArray *data) {
        if (data && data.count > 0) {
            BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
            BaseDataDelegate *ddd=(BaseDataDelegate*)weakSelf.delegate;
            ds.cellData = [NSMutableArray arrayWithArray:data];
            ds.isMultiSection = _isMultiSection;
            ddd.items = [NSMutableArray arrayWithArray:data];
            ddd.isMultiSection = _isMultiSection;
            [weakSelf reloadData];
        }
    }];
    [self.viewModel fetchHeaderData:^(NSArray *data) {
        if (data && data.count > 0) {
            BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
            ds.headerData = [NSMutableArray arrayWithArray:data];
            ds.isMultiSection = _isMultiSection;
            [weakSelf reloadData];
        }
    }];
    
    [self.viewModel fetchFooterData:^(NSArray *data) {
        if (data && data.count > 0) {
            BaseDataSource *ds=(BaseDataSource*)weakSelf.dataSource;
            ds.footerData = [NSMutableArray arrayWithArray:data];
            ds.isMultiSection = _isMultiSection;
            [weakSelf reloadData];
        }
    }];
}
- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{}
@end
