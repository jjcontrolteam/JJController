//
//  IconChangeViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "IconChangeViewController.h"
#import "IconChangeCollectionView.h"
#import "IconChangeViewModel.h"

@interface IconChangeViewController(){
    IconChangeCollectionView *_collectionView;
    IconChangeViewModel *_viewModel;
}

@end


@implementation IconChangeViewController

- (instancetype)initWithViewModel:(IconChangeViewModel *)viewModel{
    if(self = [super init]){
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图标选择";
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensureTapped)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    _collectionView = [[IconChangeCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:_viewModel];
    __weak typeof(self) weakSelf = self;
    _collectionView.block = ^{
        
    };
    
    [self.view addSubview:_collectionView];
}

- (void)ensureTapped{
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_collectionView reloadData];
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
