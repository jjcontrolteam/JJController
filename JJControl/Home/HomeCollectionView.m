//
//  HomeCollectionView.m
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeCollectionView.h"
#import "BaseDataSource.h"
#import "HomeViewModel.h"
#import "HomeDataDelegate.h"
#import "HomeCollectionCell.h"
#import "HomeReusableView.h"
static NSString *indentifer=@"HomeCollectionCell";
static NSString *reusableindentifer=@"HomeCollectionReusable";
@interface HomeCollectionView(){
    BaseDataSource *_dataSource ;
    BaseDataDelegate *_delegate;
}
@end
@implementation HomeCollectionView


- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor colorWithWhite:0.33333 alpha:1.0]];
    [self registerClass:[HomeCollectionCell class] forCellWithReuseIdentifier:indentifer];
    [self registerClass:[HomeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableindentifer];
    
    _dataSource = [[BaseDataSource alloc]initWithItems:@[]  cellIdentifier:indentifer withHeaderItem:@[] headerIdentifier:reusableindentifer andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[HomeDataDelegate alloc]initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionCell *cell2 = (HomeCollectionCell *)cell;
    if (data) {
       // NSArray *sections=[data objectAtIndex:indexPath.section];
        [cell2 fillInfo:data];
    }
    
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    if ([header isKindOfClass:[HomeReusableView class]]) {
        HomeReusableView *headerView = (HomeReusableView *)header;
        if (data) {
             [headerView setIconName:data];
        }
       
    }
    
    
}
- (void)chooseCell:(id)data withIndexPath:indexPath{
    NSLog(@"%@",data);
}

@end
