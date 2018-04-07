//
//  CategoryCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/19.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CategoryCollectionView.h"
#import "BaseDataSource.h"
#import "CategoryDataDelegate.h"
#import "CategoryCollectionViewCell.h"

static NSString *identifier = @"CategoryCollectionViewCell";

@interface CategoryCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@end

@implementation CategoryCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:identifier];
     
    _dataSource=[[BaseDataSource alloc]initWithItems:@[] cellIdentifier:identifier andCellBack:myDataSourceBlock];
    
    self.dataSource = _dataSource;
    
    _delegate = [[CategoryDataDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *newCell = (CategoryCollectionViewCell *)cell;
    [newCell setData:data];
    
}

- (void)chooseCell:(id)data withIndexPath:(NSIndexPath*)indexPath{
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
