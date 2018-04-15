//
//  BaseViewModel.h
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^fetchBlock)(NSArray *data);
typedef void (^fetchHeaderBlock)(NSArray *data);
typedef void (^fetchFooterBlock)(NSArray *data);
@interface BaseViewModel : NSObject 
-(void)fetchData:(fetchBlock)block;
-(void)fetchHeaderData:(fetchHeaderBlock)block;
-(void)fetchFooterData:(fetchFooterBlock)block;
-(void)updateCollectionView;
-(void)updateCell:(UICollectionViewCell*)cell withData:(id)model;
-(void)updateHeaderOrFooter:(UICollectionReusableView*)reusableView withData:(id)model;
@end
