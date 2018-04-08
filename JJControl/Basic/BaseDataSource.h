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

@property (nonatomic, copy) NSArray *cellData;
@property (nonatomic, copy) NSArray *headerData;
@property (nonatomic, copy) NSArray *footerData;
@property (nonatomic, copy) cellBlock cellBlock;
@property (nonatomic, copy) headerBlock  headerBlock;
@property (nonatomic, copy) footerBlock footerBlock;
@property (nonatomic, assign) BOOL isMultiSection;
/*
 创建不带头部和底部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier  andCellBack:(cellBlock)cBlock;
/*
 创建带头部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSArray*)harray headerIdentifier:(NSString *)header  andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock;
/*
 创建带底部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withFooterItem:(NSArray *)farray footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock  andFooterBack:(footerBlock)fBlock;
/*
 创建带底部,头部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSArray*)header headerIdentifier:(NSString *)header withFooterItem:(NSArray *)farray footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock andFooterBack:(footerBlock)fBlock;

/**
 重写多种不同 Cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end
