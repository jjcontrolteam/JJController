//
//  BaseCollectionView.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView
-(void)buildUI:(id)myDataSourceBlock withDelegate:(id)myDelegateBlock;
-(void)bindCell:(id)cell withData:(id)data;
-(void)chooseCell:(id)data;
@end
