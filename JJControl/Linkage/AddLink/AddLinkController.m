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
    AddLinkViewModel *viewModel;
    NSInteger index;
}
@end

@implementation AddLinkController
-(instancetype)init:(NSInteger)idnex{
    self=[super init];
    if (self) {
        index=idnex;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加联动";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    viewModel = [[AddLinkViewModel alloc] init];
    _collectionView = [[AddLinkCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:viewModel];
     [self.view addSubview:_collectionView];
    if (index==1) {
        [_collectionView fetchData];
    }else{
        [_collectionView fetchData1];
    }
    _collectionView.cellTappedBlock = ^(id data) {
        if (index==1) {//如果
            //这里插入trigger条件
            
        }else{//就
            //这里插入action条件
        }
    };
    
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
