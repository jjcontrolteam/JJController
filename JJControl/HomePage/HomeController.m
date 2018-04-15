//
//  HomeController.m
//  JJControl
//
//  Created by admin on 15/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "HomeController.h"
#import "StretchyHeaderCollectionViewLayout.h"
#import "HomeCollectionView.h"
#import "HomeViewModel.h"
#import "LINKAGE.h"
#import "LinkageViewController.h"
#import "AddRoomViewController.h"
@interface HomeController ()
{
    HomeCollectionView *conview;
}
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    StretchyHeaderCollectionViewLayout *stretchyLayout = [[StretchyHeaderCollectionViewLayout alloc] init];
    //stretchyLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    stretchyLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 40);
    stretchyLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 240);
    
    self.title = @"首页";
    HomeViewModel *vmodel=[[HomeViewModel alloc]init];
    conview = [[HomeCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:stretchyLayout withViewModel:vmodel];
    [self.view addSubview:conview];
    __weak typeof(self) weakSelf = self;
    conview.cellTappedBlock = ^(id data) {
        if([data isKindOfClass:[LINKAGE class]]){
            LinkageViewController *linkageVC = [[LinkageViewController alloc] init];
            [weakSelf.navigationController pushViewController:linkageVC animated:YES];
        }
    };
    conview.addTappedBlock = ^(NSInteger index) {
        if (index==0) {
            AddRoomViewController *roomctrl=[[AddRoomViewController alloc]init];
            [weakSelf.navigationController pushViewController:roomctrl animated:YES];
        }else{
            LinkageViewController *linkctrl=[[LinkageViewController alloc]init];
            linkctrl.linkageType=LinkageTypeAdd;
            [weakSelf.navigationController pushViewController:linkctrl animated:YES];
        }
    };
     
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
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
