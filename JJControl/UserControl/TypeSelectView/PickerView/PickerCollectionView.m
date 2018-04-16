//
//  PickerCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PickerCollectionView.h"
#import "BaseDataSource.h"
#import "BaseDataDelegate.h"
#import "TypeSelectCollectionViewCell.h"
#import "PickerViewModel.h"

@interface PickerCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@property (nonatomic, strong) PickerViewModel *viewModel;

@end

@implementation PickerCollectionView
@dynamic viewModel;

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self registerClass:[TypeSelectCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    _dataSource = [[BaseDataSource alloc] initWithItems:@[] cellIdentifier:@[identifier] andCellBack:myDataSourceBlock];
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
    [self.viewModel changeItemAtIndex:indexPath.row];
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
