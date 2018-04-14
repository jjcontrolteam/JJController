//
//  LinkageViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageViewController.h"
#import "LinkageCollectionView.h"
#import "LinkageViewModel.h"
#import "ListPickerViewController.h"
#import "LinkageModel.h"

@interface LinkageViewController (){
    LinkageCollectionView *conview;
}
@end

@implementation LinkageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = _linkageType == LinkageTypeAdd ? @"添加联动" : @"编辑联动";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sure)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];

    LinkageViewModel *vmodel=[[LinkageViewModel alloc]init];
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 400);
    conview = [[LinkageCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:vmodel];
    [self.view addSubview:conview];
    __weak typeof(self) weakSelf = self;
    conview.cellTappedBlock = ^(LinkageModel* data, NSIndexPath *indexPath) {
        if([data isKindOfClass:[LinkageModel class]]){
            NSInteger modeRow = [data.modeArray indexOfObject:data.mode];
            NSInteger stateRow = [data.stateArray indexOfObject:data.state];
            ListPickerViewController *listPickerVC = [ListPickerViewController pickerWithTitle:@"调整参数" withItems:@[data.modeArray, data.stateArray] currentRows:@[@(modeRow),@(stateRow)]];
            __strong typeof(self) strongSelf = weakSelf;
            listPickerVC.selectedBlock = ^(NSArray *selectedRows) {
                [vmodel changeDataAtSection:indexPath.section row:indexPath.row withSelectedRows:selectedRows];
                [strongSelf->conview reloadData];
            };
            listPickerVC.isMulti = YES;
            [weakSelf presentViewController:listPickerVC animated:YES completion:nil];
        }
    };
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [conview reloadData];
}

- (void)sure{
    [self dismissViewControllerAnimated:YES completion:nil];
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
