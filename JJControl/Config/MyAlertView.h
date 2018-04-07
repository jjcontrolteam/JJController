//
//  MyAlertView.h
//  JJControl
//
//  Created by admin on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAlertView : NSObject
+(void)showAlert:(NSString*)title message:(NSString*)msg cancelTitle:(NSString*)canceltxt enterTitle:(NSString*)enterTxt callback:(void (^ __nullable)(UIAlertAction *action))complete;
@end
