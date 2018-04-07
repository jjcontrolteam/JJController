//
//  TypeSelectCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TypeSelectCollectionView.h"
#import "TypeSelectCollectionViewCell.h"
#import "BaseDataDelegate.h"
#import "BaseDataSource.h"
#import "TypeSelectViewModel.h"
#import "IconChangeViewModel.h"

@interface TypeSelectCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@property(nonatomic,strong) TypeSelectViewModel *viewModel;

@end


@implementation TypeSelectCollectionView
@dynamic viewModel;

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    [self registerClass:[TypeSelectCollectionViewCell class] forCellWithReuseIdentifier:identifier];
 
    _dataSource = [[BaseDataSource alloc] initWithItems:@[] cellIdentifier:identifier andCellBack:myDataSourceBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[BaseDataDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    [self fetchData];
    
    [self layoutIfNeeded];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [cell setCellData:data];
    
}

- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{
    [self.viewModel changeSelectItem:indexPath.row];
    [self reloadData];
    if(self.block){
        self.block([[IconChangeViewModel alloc] initWithModel:data]);
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
