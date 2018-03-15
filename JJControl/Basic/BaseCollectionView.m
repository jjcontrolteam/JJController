//
//  BaseCollectionView.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        __block typeof(self) weakSelf=self;
        void (^myDataSourceBlock)(id cell , id data) = ^(id cell ,id data){
            //cell数据的填充方法
            [weakSelf bindCell:cell withData:data];
        };
        void (^myDelegateBlock)(id data) = ^(id data){
            //cell数据的填充方法
            [weakSelf chooseCell:data];
        };
        
        [self buildUI:myDataSourceBlock withDelegate:myDelegateBlock];
    }
    return self;
}

-(void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock{
    
}

-(void)bindCell:(id)cell withData:(id)data{}
-(void)chooseCell:(id)data{}
@end
