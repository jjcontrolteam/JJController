//
//  UserBaseController.h
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserBaseController : UIViewController<UITextFieldDelegate>
- (void)resetView:(float)move;
- (void)backAction:(id)sender;
@end
