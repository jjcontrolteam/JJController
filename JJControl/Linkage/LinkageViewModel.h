//
//  LinkageViewModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"
 
@interface LinkageViewModel : BaseViewModel

- (void)changeDataAtSection:(NSInteger)section row:(NSInteger)row withSelectedRows:(NSArray *)selectedRows;

@end
