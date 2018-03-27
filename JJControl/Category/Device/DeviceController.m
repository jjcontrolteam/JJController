//
//  DeviceController.m
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceController.h"
#import "DeviceCollectionView.h"
#import "ControlController.h"
#import "DeviceViewModel.h"
@interface DeviceController (){
    DeviceCollectionView *_collectionView;
}

@end

@implementation DeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"灯光";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionHeadersPinToVisibleBounds = true;
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    DeviceViewModel *viewModel=[[DeviceViewModel alloc]init];
    _collectionView = [[DeviceCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:viewModel];
    __block __weak typeof(self) weakSelf = self;
    _collectionView.block = ^{
        ControlController *controlController = [[ControlController alloc] init];
        controlController.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:controlController animated:YES];
    };

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
