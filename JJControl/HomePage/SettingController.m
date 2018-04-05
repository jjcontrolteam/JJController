//
//  SettingController.m
//  JJControl
//
//  Created by admin on 15/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SettingController.h"
#import "SettingCollectionView.h"
#import "SettingViewModel.h"
#import "ModifyViewController.h"

@interface SettingController (){
    SettingCollectionView *_collectionView;

}
    
@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"设置";
    SettingViewModel *sVModel=[[SettingViewModel alloc]init];
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    _collectionView = [[SettingCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:sVModel];
    
    __block __weak typeof(self) weakSelf = self;
    _collectionView.block = ^{
        ModifyViewController *modifyViewController = [[ModifyViewController alloc] initWithTitle:@"标题啊" currentText:@"老的字符串"];
        modifyViewController.editBlock = ^(NSString *newStr) {
            NSLog(@"%@", newStr);
        };
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:modifyViewController];
        [weakSelf presentViewController:nav animated:YES completion:nil];
    };
    [self.view addSubview:_collectionView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_collectionView reloadData];
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
