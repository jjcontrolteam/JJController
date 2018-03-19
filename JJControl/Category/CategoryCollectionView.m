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
#import "CategoryCollectionCell.h"
static NSString *identifier = @"CategoryCollectionCell";

@interface CategoryCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@end

@implementation CategoryCollectionView

- (void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[CategoryCollectionCell class] forCellWithReuseIdentifier:identifier];
    
    _dataSource = [[BaseDataSource alloc] initWithItems:@[@"",@"",@""] cellIdentifier:identifier headerIdentifier:nil footerIdentifier:nil andCallBack:^(id cell, id data) {
        
    }];
    self.dataSource = _dataSource;
    
    _delegate = [[CategoryDataDelegate alloc] initWithItems:@[@"",@"",@""] andCallBack:^(id data) {
        
    }];
    self.delegate = _delegate;
}

- (void)bindCell:(id)cell withData:(id)data{
    CategoryCollectionCell *newCell = (CategoryCollectionCell *)cell;
 }

- (void)chooseCell:(id)data{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
