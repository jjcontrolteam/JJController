//
//  UserBaseController.h
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserBaseController : UIViewController<UITextFieldDelegate>
-(void)resetView:(float)move;
-(void)showHud;
-(void)showStatus:(NSString*)msg;
-(void)hiddenHud;
-(void)backAction:(id)sender;
-(void)connectFailue;
@end
