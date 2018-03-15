//
//  BaseDataDelegate.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseDataDelegate.h"
@interface BaseDataDelegate(){
    NSArray *_items;
    NSString       *_identifier;
    cellDelegateBlock      callBlock;
}
@end

@implementation BaseDataDelegate
-(void)dealloc{
    callBlock = nil;
}

-(instancetype)initWithItems:(NSArray *)array  andCallBack:(cellDelegateBlock)block{
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
@end
