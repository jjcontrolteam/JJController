//
//  BaseCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        __block typeof(self) weakSelf=self;
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
        void (^myDelegateBlock)(id data) = ^(id data){
            //cell数据的填充方法
            [weakSelf chooseCell:data];
        };
        
        [self buildUI:myDataSourceBlock withHeaderBlock:myHeadererBlock withFooterBlock:myFooterBlock withDelegate:myDelegateBlock];
    }
    return self;
}

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
}
- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath*)indexPath{}
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{}
- (void)bindFooterer:(id)footer withData:(id)data withIndexPath:(NSIndexPath*)indexPath{}
- (void)chooseCell:(id)data{}
@end