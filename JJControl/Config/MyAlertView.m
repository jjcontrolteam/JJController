//
//  MyAlertView.m
//  JJControl
//
//  Created by admin on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

+(void)showAlert:(NSString*)title message:(NSString*)msg cancelTitle:(NSString*)canceltxt enterTitle:(NSString*)enterTxt callback:(void (^ __nullable)(UIAlertAction *action))complete{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    if (canceltxt&&[canceltxt length]>0) {
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:canceltxt style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 if (complete) {
                                                                     complete(action);
                                                                 }
                                                             }];
         [alert addAction:cancelAction];
    }
    if (enterTxt&&[enterTxt length]>0) {
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:enterTxt style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  //响应事件
                                                                  if (complete) {
                                                                      complete(action);
                                                                  }
                                                              }];
         [alert addAction:defaultAction];
    }
   
   
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UINavigationController *nav=(UINavigationController *)window.rootViewController;
    [nav presentViewController:alert animated:YES completion:nil];
}
@end
