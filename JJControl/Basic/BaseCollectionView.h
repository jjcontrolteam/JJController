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
@property(nonatomic,strong) BaseViewModel *viewModel; 
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout withViewModel:(BaseViewModel*)vModel;
- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock;
- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindFooterer:(id)footer withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)chooseCell:(id)data;
-(void)fetchData;
@end
