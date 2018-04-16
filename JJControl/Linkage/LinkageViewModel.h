//
//  LinkageViewModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"
@class LINKAGE;
@class ACTIONS;
@class TRIGGER;
@interface LinkageViewModel : BaseViewModel

- (void)changeDataAtSection:(NSInteger)section row:(NSInteger)row withSelectedRows:(NSArray *)selectedRows;
-(void)insertLink:(LINKAGE*)link withAction:(ACTIONS*)action withTrrige:(TRIGGER*)trigger callback:(fetchBlock)block;
@end
