//
//  LinkageCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageCollectionView.h"
#import "LinkageDataSource.h"
#import "LinkageDataDelegate.h"
#import "LinkageCollectionViewCell.h"
#import "LinkageCollectionReusableView.h"
#import "LinkageNameReusableView.h"
#import "LinkageTipsReusableView.h"
@interface LinkageCollectionView(){

    BaseDataSource *_dataSource ;
    BaseDataDelegate *_delegate;
}
@end

@implementation LinkageCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    [self setBackgroundColor:[UIColor colorWithWhite:0.666666 alpha:1.0]];
    [self registerClass:[LinkageCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self registerClass:[LinkageCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [self registerClass:[LinkageNameReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:linkageNameidentifier];
    [self registerClass:[LinkageTipsReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:linkagetipsidentifier];
    
    _dataSource = [[LinkageDataSource alloc]initWithItems:@[]  cellIdentifier:identifier withHeaderItem:@[] headerIdentifier:headerIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[LinkageDataDelegate alloc]initWithItems:@[] andCallBack:myDelegateBlock];
    self.delegate = _delegate;
    
    self.isMultiSection = YES;

    //放最后，由于延迟加载数据
    [self fetchData];
}

- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel updateCell:cell withData:data];
}

- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath{
    
    if ([indexPath section]==0) {
        LinkageNameReusableView *header1 = (LinkageNameReusableView *)header;
        [header1 setData:data];
    } else if ([indexPath section]==2) {
        LinkageTipsReusableView *header1 = (LinkageTipsReusableView *)header;
        [header1 setData:data];
    }else{
        LinkageCollectionReusableView *header1 = (LinkageCollectionReusableView *)header;
        [header1 setData:data];
        header1.tapBlock = ^(UICollectionReusableView *reusableView) {
            if (self.headerTappedBlock) {
                self.headerTappedBlock(data,indexPath);
            }
        };
        
    }
    
}
- (void)chooseCell:(id)data withIndexPath:indexPath{
    NSLog(@"%@",data);
    if(self.cellTappedBlock){
        self.cellTappedBlock(data, indexPath);
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
