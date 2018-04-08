//
//  PickerViewModel.h
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BaseViewModel.h"

typedef NS_ENUM(NSInteger, PickerViewType){
    PickerViewTypeSingle,
    PickerViewTypeMulti
};

@interface PickerViewModel : BaseViewModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, assign) PickerViewType pickerViewType;

- (instancetype)initWithTitle:(NSString *)title array:(NSArray *)array;

- (void)changeItemAtIndex:(NSInteger)index;

@end
