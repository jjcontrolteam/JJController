//
//  RoomCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionView.h"
#import "BaseDataSource.h"
#import "BaseDataDelegate.h"
#import "RoomCollectionCell.h"

static NSString *indentifer=@"RoomTableViewCell";
  
@interface RoomCollectionView(){
    BaseDataSource *_dataSource ;
    BaseDataDelegate *_delegate;
}
@end
@implementation RoomCollectionView

-(void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    [self registerClass:[RoomCollectionCell class] forCellWithReuseIdentifier:indentifer];
   
     _dataSource = [[BaseDataSource alloc]initWithItems:@[@"aaa"] cellIdentifier:indentifer andCallBack:myDataSourceBlock];
     self.dataSource = _dataSource;
    
     _delegate = [[BaseDataDelegate alloc]initWithItems:@[@"aaa"]  andCallBack:myDelegateBlock];
     self.delegate = _delegate; 
}

-(void)bindCell:(id)cell withData:(id)data{
    RoomCollectionCell *cell2 = (RoomCollectionCell *)cell;
    [cell2 fillInfo:data];
}
-(void)chooseCell:(id)data{
    NSLog(@"%@",data);
}
@end
