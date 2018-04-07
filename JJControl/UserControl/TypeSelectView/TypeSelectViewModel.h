//
//  TypeSelectViewModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"

@interface TypeSelectViewModel : BaseViewModel

//选中某一个 其他设置为不选中
- (void)changeSelectItem:(NSInteger)index;

    
@end
