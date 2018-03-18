//
//  BaseDataSource.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseDataSource.h"
@interface BaseDataSource(){
    NSArray *_items;
    NSString       *_identifier;
    NSString       *_header;
    NSString       *_footer;
    cellBlock      callBlock;
}
@end
@implementation BaseDataSource
-(void)dealloc{
    callBlock = nil;
}
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier headerIdentifier:(NSString *)header footerIdentifier:(NSString *)footer andCallBack:(cellBlock)block{
    
    self = [super init];
    if (self) {
        _items = [NSMutableArray arrayWithArray:array];
        _identifier = identifier;
        _header = header;
        _footer = footer;
        callBlock = block;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UICollectionViewCell alloc]init];

    }
    cell.backgroundColor = [UIColor whiteColor];
    id theme = _items[indexPath.row];
    if (callBlock) {
        callBlock(cell,theme);
    }
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        //定制头部视图的内容
        UICollectionReusableView *headerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_header  forIndexPath:indexPath];
        reusableView = headerV;
    }
    if (kind ==UICollectionElementKindSectionFooter){
        UICollectionReusableView *headerV = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:_footer  forIndexPath:indexPath];
        reusableView = headerV;
    }
    return reusableView;
}

@end
