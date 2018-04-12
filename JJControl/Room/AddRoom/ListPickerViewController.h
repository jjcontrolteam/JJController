//
//  ListPickerViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)(NSInteger index);

@interface ListPickerViewController : UIViewController

+ (instancetype)pickerWithTitle:(NSString *)title withItems:(NSArray *)items currentRow:(NSInteger)currentRow;

@property (nonatomic, copy) SelectedBlock selectedBlock;

@end
