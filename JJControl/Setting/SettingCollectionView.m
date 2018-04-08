//
//  SettingCollectionView.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SettingCollectionView.h"
#import "SettingDataDelegate.h"
#import "SettingCollectionViewCell.h"
#import "SettingDataSource.h"
#import "SpanCollectionViewCell.h"
#import "ButtonCollectionViewCell.h"
#import "InfoCollectionReusableView.h"

@interface SettingCollectionView(){
    SettingDataSource *_dataSource;
    BaseDataDelegate *_delegate;
}

@end

@implementation SettingCollectionView

- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock{
    
    self.backgroundColor = [UIColor lightGrayColor];

    [self registerClass:[SettingCollectionViewCell class] forCellWithReuseIdentifier:settingIdentifier];
    [self registerClass:[SpanCollectionViewCell class] forCellWithReuseIdentifier:spanIdentifier];
    [self registerClass:[InfoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:infoIdentifier];
    [self registerClass:[ButtonCollectionViewCell class] forCellWithReuseIdentifier:buttonIndentifier];
    
    _dataSource = [[SettingDataSource alloc] initWithItems:@[] cellIdentifier:settingIdentifier withHeaderItem:@[] headerIdentifier:infoIdentifier andCellBack:myDataSourceBlock andHeaderBack:headerBlock];
    self.dataSource = _dataSource;
    
    _delegate = [[SettingDataDelegate alloc] initWithItems:@[] andCallBack:myDelegateBlock];
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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
