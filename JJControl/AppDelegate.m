//
//  AppDelegate.m
//  JJControl
//
//  Created by admin on 2018/3/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "JRDB.h"
#import "USER.h"
#import "TIMING.h"
#import "TRIGGER.h"
#import "SETTING.h"
#import "ROOM.h"
#import "SCENE.h"
#import "SHARE.h"
#import "SETTING.h"
#import "LOG_TABLE.h"
#import "PANEL_KEY.h"
#import "PARAM_ADJUST.h"
#import "MJExtension.h"
@interface AppDelegate ()
{
    
}
@property(nonatomic,assign) UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  //  [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
   /* USER *user=[[USER alloc]init];
    [[JRDBMgr shareInstance] registerClazzes:@[
                                               [USER class],[TRIGGER class],[TIMING class],[SHARE class],[SETTING class],[SCENE class],[ROOM class],[PARAM_ADJUST class],[PANEL_KEY class],[LOG_TABLE class],
                                               ]];
    [USER jr_primaryKey];
    [user setPASSWORD:@"39aebe95200c5538ecf37cab57848447"];
    [user jr_save];
   
    PANEL_KEY *panel=[[PANEL_KEY alloc]init];
    [PANEL_KEY jr_primaryKey];
    panel.CHANNEL=1;
    panel.KEY=@"12-1";
    panel.PARENT=18;
    [panel jr_save];
    
    SETTING *setting=[[SETTING alloc]init];
    [SETTING jr_primaryKey];
    setting.ID=@"11652348477502";
    setting.KEY = @"3232";
    setting.PARENT = 0;
    setting.VALUE = @"117.141625";
    [setting jr_save];
    */
    
    NSDictionary *dict=@{@"cmd":@"1001",@"table":@"USER",@"rows":@[@{@"PASSWORD":@"39aebe95200c5538ecf37cab57848447"}]};
    [self sysStartFetchData:dict];
    return YES;
}
-(void)sysStartFetchData:(NSDictionary*)dict{
    NSString *tbclass=[dict valueForKey:@"table"];
    if (tbclass) {
        if (tbclass) {
            for (NSDictionary *val in [dict valueForKey:@"rows"]) {
                id  tbmodel=[NSClassFromString(tbclass) mj_objectWithKeyValues:val];
                [[JRDBMgr shareInstance] registerClazzes:@[NSClassFromString(tbclass)]];
                [tbmodel jr_save];
            }
        }
    }
}
                 

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    /*self.backgroundTaskIdentifier =[application beginBackgroundTaskWithExpirationHandler:^(void) {
        // 清理工作需要在主线程中用同步的方式来进行
        [self endBackgroundTask];
    }];
    */
}
- (void) endBackgroundTask{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    __block __weak typeof(self) weakSelf= self;
    dispatch_async(mainQueue, ^(void) {
        AppDelegate *strongSelf = weakSelf;
        if (strongSelf != nil){
            // 每个对 beginBackgroundTaskWithExpirationHandler:方法的调用,必须要相应的调用 endBackgroundTask:方法。这样，来告诉应用程序你已经执行完成了。
            // 也就是说,我们向 iOS 要更多时间来完成一个任务,那么我们必须告诉 iOS 你什么时候能完成那个任务。
            // 也就是要告诉应用程序：“好借好还”嘛。
            // 标记指定的后台任务完成
            [[UIApplication sharedApplication] endBackgroundTask:weakSelf.backgroundTaskIdentifier];
            // 销毁后台任务标识符
            weakSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
        }
    });
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
