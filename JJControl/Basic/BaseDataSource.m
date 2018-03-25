//
//  BaseDataSource.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseDataSource.h"
@interface BaseDataSource(){
    
    NSDictionary    *_headerData;
    NSDictionary    *_footerData;
    NSString       *_identifier;
    NSString       *_header;
    NSString       *_footer;
    headerBlock    _headerBlock;
    footerBlock    _footerBlock;
}
@end

@implementation BaseDataSource
- (void)dealloc{
    _cellBlock = nil;
    _headerBlock = nil;
    _footerBlock = nil;
}

- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier  andCellBack:(cellBlock)cBlock {
    
    self = [super init];
    if (self) {
        _cellData = [NSMutableArray arrayWithArray:array];
        _identifier = identifier;
        _cellBlock = cBlock;
        _header = @"";
        _footer = @"";
    }
    return self;
}
/*
 创建带头部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSDictionary*)item headerIdentifier:(NSString *)header  andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock {
    
    self = [super init];
    if (self) {
        _cellData = [NSMutableArray arrayWithArray:array];
        _headerData=[NSDictionary dictionaryWithDictionary:item];
        _identifier = identifier;
        _header = header;
        _footer = @"";
        _cellBlock = cBlock;
        _headerBlock=hBlock;
    }
    return self;
}
/*
 创建带底部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withFooterItem:(NSDictionary *)item footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock  andFooterBack:(footerBlock)fBlock{
    
    self = [super init];
    if (self) {
        _cellData = [NSMutableArray arrayWithArray:array];
        _footerData=[NSDictionary dictionaryWithDictionary:item];
        _identifier = identifier;
        _header = @"";
        _footer = footer;
        _cellBlock = cBlock;
        _footerBlock =fBlock;
    }
    return self;
}
/*
 创建带底部,头部的视图
 */
- (instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier withHeaderItem:(NSDictionary*)hitem headerIdentifier:(NSString *)header withFooterItem:(NSDictionary *)fitem footerIdentifier:(NSString *)footer andCellBack:(cellBlock)cBlock andHeaderBack:(headerBlock)hBlock andFooterBack:(footerBlock)fBlock{
    
    self = [super init];
    if (self) {
        _cellData = [NSMutableArray arrayWithArray:array];
        _headerData=[NSDictionary dictionaryWithDictionary:hitem];
        _footerData=[NSDictionary dictionaryWithDictionary:fitem];
        _identifier = identifier;
        _header = header;
        _footer = footer;
        _cellBlock = cBlock;
        _headerBlock=hBlock;
        _footerBlock =fBlock;
    }
    return self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cellData.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UICollectionViewCell alloc]init];

    }
    cell.backgroundColor = [UIColor whiteColor];
    id theme = _cellData[indexPath.row];
    if (_cellBlock) {
        _cellBlock(cell,theme,indexPath);
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        //定制头部视图的内容
        UICollectionReusableView *headerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_header  forIndexPath:indexPath];
        
        reusableView = headerV;
        if (_headerBlock) {
            _headerBlock(headerV,_headerData,indexPath);
        }
    }
    if (kind ==UICollectionElementKindSectionFooter){
        UICollectionReusableView *headerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:_footer  forIndexPath:indexPath];
        reusableView = headerV;
        if (_footerBlock) {
            _footerBlock(headerV,_footerData,indexPath);
        }
    }
    return reusableView;
}
 

@end
