//
//  AddLinkController.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddLinkController.h"
#import "AddLinkCollectionView.h"
#import "AddLinkViewModel.h"
@interface AddLinkController ()
{
    AddLinkCollectionView *_collectionView;
}
@end

@implementation AddLinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加联动";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    AddLinkViewModel *viewModel = [[AddLinkViewModel alloc] init];
    _collectionView = [[AddLinkCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:viewModel];
     [self.view addSubview:_collectionView];
    
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
