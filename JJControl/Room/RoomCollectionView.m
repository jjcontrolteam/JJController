//
//  RoomCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionView.h"
#import "BaseDataSource.h"
#import "RoomDataDelegate.h"
#import "RoomCollectionCell.h"
#import "RoomCollectionReusable.h"
static NSString *indentifer=@"RoomTableViewCell";
static NSString *reusableindentifer=@"RoomCollectionReusable";
@interface RoomCollectionView(){
    BaseDataSource *_dataSource ;
    BaseDataDelegate *_delegate;
}
@end
@implementation RoomCollectionView

-(void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor colorWithWhite:0.33333 alpha:1.0]];
    [self registerClass:[RoomCollectionCell class] forCellWithReuseIdentifier:indentifer];
    [self registerClass:[RoomCollectionReusable class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableindentifer];
    
    _dataSource = [[BaseDataSource alloc]initWithItems:@[@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]  cellIdentifier:indentifer withHeaderItem:@{@"":@""} headerIdentifier:reusableindentifer andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
     self.dataSource = _dataSource;
    
     _delegate = [[RoomDataDelegate alloc]initWithItems:@[@"aaa",@"aaa",@"aaa",@"aaa",@"aaa"]  andCallBack:myDelegateBlock];
     self.delegate = _delegate; 
}

-(void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    RoomCollectionCell *cell2 = (RoomCollectionCell *)cell;
    [cell2 fillInfo:data];
}

-(void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
}
-(void)chooseCell:(id)data{
    NSLog(@"%@",data);
}
@end
