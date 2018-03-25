//
//  CategoryViewModel.m
//  JJControl
//
//  Created by admin on 2018/3/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "CategoryViewModel.h"
#import "CategoryCellModel.h"
@implementation CategoryViewModel
-(void)fetchData:(fetchBlock)block
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 15; i++) {
        NSString *title = [NSString stringWithFormat:@"灯光 %@", @(i)];
        CategoryCellModel *model = [CategoryCellModel modelWithPic:@"JJControlResource.bundle/icon_cj_ys_on.png" title:title details:@"8/30"];
        [array addObject:model];
    }
    block(array);
}
 
@end
