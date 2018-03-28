//
//  CategoryController.m
//  JJControl
//
//  Created by admin on 15/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "CategoryController.h"
#import "CategoryCollectionView.h"
#import "DeviceController.h"
#import "CategoryViewModel.h"
@interface CategoryController (){
    CategoryCollectionView *_collectionView;
}

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"安防";
    CategoryViewModel *vModel=[[CategoryViewModel alloc]init];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);

    _collectionView = [[CategoryCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:vModel];
    __block __weak typeof(self) weakSelf = self;
    _collectionView.block = ^{
        DeviceController *deviceController = [[DeviceController alloc] init];
        [weakSelf.navigationController pushViewController:deviceController animated:YES];
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
