//
//  PickerViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "PickerViewController.h"
#import "PickerCollectionView.h"
#import "PickerViewModel.h"

@interface PickerViewController (){
    PickerCollectionView *_collectionView;
    PickerViewModel *_viewModel;
}
@property (nonatomic, strong) NSMutableArray *selectArray;
@end

@implementation PickerViewController

- (instancetype)initWithViewModel:(PickerViewModel *)viewModel{
    if(self = [super init]){
        _viewModel = viewModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = _viewModel.title;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensure)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    _collectionView = [[PickerCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:_viewModel];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:_collectionView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_collectionView reloadData];
}

- (void)ensure{
    //确定  此处保存数据
    
    if(self.ensureBlock){
        self.ensureBlock(_viewModel.array);
    }
    [self cancel];
}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
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
