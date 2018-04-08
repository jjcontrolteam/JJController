//
//  PickerViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserBaseController.h"
@class PickerViewModel;

typedef void(^EnsureBlock)(NSArray *array);

@interface PickerViewController : UserBaseController

@property (nonatomic, copy) EnsureBlock ensureBlock;

- (instancetype)initWithViewModel:(PickerViewModel *)viewModel;

@end
