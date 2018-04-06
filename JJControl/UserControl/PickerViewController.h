//
//  PickerViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PickerViewType){
    PickerViewTypeSingle,
    PickerViewTypeMulti
};

typedef void(^SelectionBlock)(NSArray *);

@interface PickerViewController : UIViewController

@property (nonatomic, copy) SelectionBlock selectionBlock;
@property (nonatomic, assign) PickerViewType pickerViewType;

- (instancetype)initWithTitle:(NSString *)title selectItem:(NSString *)selectItem
                        array:(NSArray *)array;

@end
