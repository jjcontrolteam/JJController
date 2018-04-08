//
//  TypeSelectViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "TypeSelectViewController.h"
#import "TypeSelectCollectionView.h"
#import "TypeSelectViewModel.h"
#import "IconChangeViewController.h"
#import "IconChangeViewModel.h"

@interface TypeSelectViewController(){
    TypeSelectCollectionView *_collectionView;
    TypeSelectViewModel *_typeSelectViewModel;
}

@end
 

@implementation TypeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"选择类型";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(goToIconEditPage)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    _typeSelectViewModel = [[TypeSelectViewModel alloc] init];
    _collectionView = [[TypeSelectCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:_typeSelectViewModel];
    __weak typeof(self) weakSelf = self;
    _collectionView.block = ^() {
        [weakSelf goToIconEditPage];
    };
    
    [self.view addSubview:_collectionView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_collectionView reloadData];
}

- (void)goToIconEditPage{
    //获取选中的
    IconChangeViewModel *iconChangeVM = [_typeSelectViewModel iconChangeViewModelForSelectItem];
    if(iconChangeVM){
        IconChangeViewController *IconChangeVC = [[IconChangeViewController alloc] initWithViewModel:iconChangeVM];
        [self.navigationController pushViewController:IconChangeVC animated:YES];
    }
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
