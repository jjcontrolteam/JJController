//
//  ListPickerViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)(NSArray* selectedRows);

@interface ListPickerViewController : UIViewController

+ (instancetype)pickerWithTitle:(NSString *)title withItems:(NSArray *)items currentRows:(NSArray *)currentRows;

@property (nonatomic, assign) BOOL isMulti;
@property (nonatomic, copy) SelectedBlock selectedBlock;

@end
