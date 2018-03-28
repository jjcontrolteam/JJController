//
//  BaseDataDelegate.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseDataDelegate.h"
@interface BaseDataDelegate(){
    NSString       *_identifier;
    cellDelegateBlock      callBlock;
}


@end

@implementation BaseDataDelegate
- (void)dealloc{
    callBlock = nil;
}

- (instancetype)initWithItems:(NSArray *)array  andCallBack:(cellDelegateBlock)block{
    self = [super init];
    if (self) {
        _items = [NSMutableArray arrayWithArray:array]; 
        callBlock = block;
    }
    return self;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    id theme = _items[indexPath.row];
    if (callBlock) {
        callBlock(theme);
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.5f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
////设置Cell样式
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 51);
//}



@end
