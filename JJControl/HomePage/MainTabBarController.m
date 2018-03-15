//
//  MainTabBarController.m
//  JJControl
//
//  Created by admin on 15/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeController.h"
#import "RoomController.h"
#import "CategoryController.h"
#import "SettingController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeController *homeVC = [[HomeController alloc] init];
    UINavigationController *homeNavController = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNavController.tabBarItem.title = @"全部";
    homeNavController.tabBarItem.image = [[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNavController.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:homeNavController];
  
    RoomController *roomVC = [[RoomController alloc] init];
    UINavigationController *roomNavController = [[UINavigationController alloc]initWithRootViewController:roomVC];
    roomNavController.tabBarItem.title = @"房间";
    roomNavController.tabBarItem.image = [[UIImage imageNamed:@"room"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    roomNavController.tabBarItem.selectedImage = [[UIImage imageNamed:@"room_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:roomNavController];

    CategoryController *categoryVC = [[CategoryController alloc] init];
    UINavigationController *categoryNavController = [[UINavigationController alloc]initWithRootViewController:categoryVC];
    categoryNavController.tabBarItem.title = @"类别";
    categoryNavController.tabBarItem.image = [[UIImage imageNamed:@"type"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    categoryNavController.tabBarItem.selectedImage = [[UIImage imageNamed:@"type_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:categoryNavController];

    SettingController *settingVC = [[SettingController alloc] init];
    UINavigationController *settingNavController = [[UINavigationController alloc]initWithRootViewController:settingVC];
    settingNavController.tabBarItem.title = @"设置";
    settingNavController.tabBarItem.image = [UIImage imageNamed:@"setting"];
    settingNavController.tabBarItem.selectedImage = [UIImage imageNamed:@"setting_on"];
    [self addChildViewController:settingNavController];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
