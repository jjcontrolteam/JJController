//
//  BaseCollectionView.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h" 
@interface BaseCollectionView : UICollectionView
@property (nonatomic, strong, readonly) BaseViewModel *viewModel;
@property (nonatomic, assign) BOOL isMultiSection;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout withViewModel:(BaseViewModel*)vModel;
- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock;
- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindFooterer:(id)footer withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath;
-(void)fetchData;

//需要新增  该行数据源改变 更新当前row的方法

@end
