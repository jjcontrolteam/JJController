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
#import "CategoryModel.h"


static NSString *identifier = @"CategoryCollectionViewCell";

@interface CategoryCollectionView(){
    BaseDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}
@end

@implementation CategoryCollectionView

- (void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    [self setBackgroundColor:[UIColor redColor]];
    [self registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 15; i++) {
        NSString *title = [NSString stringWithFormat:@"灯光 %@", @(i)];
        CategoryModel *model = [CategoryModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title details:@"8/30"];
        [array addObject:model];
    }
    _dataSource=[[BaseDataSource alloc]initWithItems:array cellIdentifier:identifier andCellBack:myDataSourceBlock];
    
    self.dataSource = _dataSource;
    
    _delegate = [[CategoryDataDelegate alloc] initWithItems:array andCallBack:myDelegateBlock];
    self.delegate = _delegate;
}

-(void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    CategoryCollectionViewCell *newCell = (CategoryCollectionViewCell *)cell;
    [newCell setData:data];
}

- (void)chooseCell:(id)data{
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
