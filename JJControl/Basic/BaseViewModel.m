//
//  BaseViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)fetchData:(fetchBlock)block{
    block(@[@"1",@"2",@"3"]);
}

-(void)fetchHeaderData:(fetchHeaderBlock)block{
    block(@[]);
}
-(void)fetchFooterData:(fetchFooterBlock)block{
    block(@[]);
}
-(void)updateCollectionView{
    
}
-(void)updateCell:(UICollectionViewCell*)cell withData:(id)model{
    
}
@end
