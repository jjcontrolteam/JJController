//
//  ModifyViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/3/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EditBlock)(NSString *newStr);

@interface ModifyViewController : UIViewController

@property (nonatomic, copy) EditBlock editBlock;

- (instancetype)initWithTitle:(NSString *)title currentText:(NSString *)currentText;

@end
