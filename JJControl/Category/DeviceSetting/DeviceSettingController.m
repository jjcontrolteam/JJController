//
//  DeviceSettingController.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingController.h"
#import "DeviceSettingCollectionView.h"

@interface DeviceSettingController (){
    DeviceSettingCollectionView *_collectionView;
}

@end

@implementation DeviceSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[DeviceSettingCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    __block __weak typeof(self) weakSelf = self;
    _collectionView.block = ^{
        
    };
//
    [self.view addSubview:_collectionView];
}

- (void)viewWillAppear:(BOOL)animated{
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
