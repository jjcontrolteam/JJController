//
//  BaseDataSource.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^cellBlock)(id cell , id data,NSIndexPath *indexPath);
typedef void (^headerBlock)(id header , id data,NSIndexPath *indexPath);
typedef void (^footerBlock)(id footer , id data,NSIndexPath *indexPath);
@interface BaseDataSource : NSObject<UICollectionViewDataSource>
/*
 创建不带头部和底部的视图
 */
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier  andCellBack:(cellBlock)cBlock;
/*
 创建带头部的视图
 */
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSDictionary*)item headerIdentifier:(NSString *)header  andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock;
/*
 创建带底部的视图
 */
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withFooterItem:(NSDictionary *)item footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock  andFooterBack:(footerBlock)fBlock;
/*
 创建带底部,头部的视图
 */
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSDictionary*)hitem headerIdentifier:(NSString *)header withFooterItem:(NSDictionary *)fitem footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock andFooterBack:(footerBlock)fBlock;
@end
