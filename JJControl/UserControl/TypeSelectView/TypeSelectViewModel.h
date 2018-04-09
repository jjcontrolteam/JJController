//
//  TypeSelectViewModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"
@class IconChangeViewModel;

@interface TypeSelectViewModel : BaseViewModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray *array;

- (instancetype)initWithTitle:(NSString *)title array:(NSArray *)array;

- (void)changeSelectItem:(NSInteger)index;

- (IconChangeViewModel *)iconChangeViewModelForSelectItem;

@end
