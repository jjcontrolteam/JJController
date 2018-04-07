//
//  IconChangeCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconChangeCollectionView.h"
#import "BaseDataSource.h"
#import "BaseDataDelegate.h"
#import "IconChangeCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "IconChangeDataSource.h"
#import "IconChangeDateDelegate.h"
@interface IconChangeCollectionView(){
    IconChangeDataSource *_dataSource;
    IconChangeDateDelegate *_delegate;
}

@end

@implementation IconChangeCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    [self registerClass:[IconChangeCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    
    _dataSource = [[IconChangeDataSource alloc] initWithItems:@[] cellIdentifier:identifier withHeaderItem:@{} headerIdentifier:headerIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[IconChangeDateDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    [self fetchData];
    
    [self layoutIfNeeded];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [cell setCellData:data];
    
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [header setCellData:data];
}

- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{
     if(self.block){
        self.block();
    }
}

@end
