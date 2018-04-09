//
//  TypeSelectViewModel.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TypeSelectViewModel.h"
#import "IconChangeViewModel.h"
#import "DeviceModel.h"

@interface TypeSelectViewModel(){
    DeviceModel *_currentDeviceItem;
}
 
@end

@implementation TypeSelectViewModel

- (instancetype)initWithTitle:(NSString *)title array:(NSArray *)array{
    if(self = [super init]){
        _title = title;
        _array = [[NSMutableArray alloc] init];
        for (DeviceModel *model in array) {
            [_array addObject:[model mutableCopy]];
        }
    }
    return self;
}

- (void)fetchData:(fetchBlock)block{
    block(self.array);
}

- (void)changeSelectItem:(NSInteger)index{
    for(NSInteger i = 0; i < self.array.count; i++){
        DeviceModel *model = [self.array objectAtIndex:i];
        if(i == index)
            model.isOn = YES;
        else
            model.isOn = NO;
    }
}

- (IconChangeViewModel *)iconChangeViewModelForSelectItem{
    for(NSInteger i = 0; i < self.array.count; i++){
        DeviceModel *model = [self.array objectAtIndex:i];
        if(model.isOn == YES){
            return [[IconChangeViewModel alloc] initWithModel:model];
        }
    }
    return nil;
}

@end
