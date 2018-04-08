//
//  PickerViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PickerViewModel.h"
#import "DeviceModel.h"

@interface PickerViewModel(){
}

@end

@implementation PickerViewModel

- (instancetype)initWithTitle:(NSString *)title array:(NSArray *)array{
    if(self = [super init]){
        _title = title;
        _array = [[NSMutableArray alloc] init];
        for (DeviceModel *model in array) {
            [_array addObject:[model mutableCopy]];
        }
        _pickerViewType = PickerViewTypeSingle;
    }
    return self;
}

- (void)fetchData:(fetchBlock)block{
    block(self.array);
}

- (void)changeItemAtIndex:(NSInteger)index{
    if(self.pickerViewType == PickerViewTypeSingle){
        for (NSInteger i = 0; i < _array.count; i++) {
            DeviceModel *model = [_array objectAtIndex:i];
            if(i == index){
                model.isOn = YES;
            }else{
                model.isOn = NO;
            }
        }
    }else{
        DeviceModel *model = [_array objectAtIndex:index];
        model.isOn = !model.isOn;
    }
}

@end
