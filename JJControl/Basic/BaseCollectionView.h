//
//  BaseCollectionView.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView
- (void)buildUI:(id)myDataSourceBlock withHeaderBlock:(id)headerBlock withFooterBlock:(id)footerBlock withDelegate:(id)myDelegateBlock;
- (void)bindCell:(id)cell withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindHeader:(id)header withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)bindFooterer:(id)footer withData:(id)data withIndexPath:(NSIndexPath*)indexPath;
- (void)chooseCell:(id)data;
@end
