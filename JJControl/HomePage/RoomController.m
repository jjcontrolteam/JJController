//
//  RoomController.m
//  JJControl
//
//  Created by admin on 15/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "RoomController.h"
#import "BaseCollectionLayout.h"
#import "RoomCollectionView.h"
#import "RoomViewModel.h"
@interface RoomController ()
{
    RoomCollectionView *conview;
}
@end

@implementation RoomController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"房间";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addRoom)];
    
    RoomViewModel *vmodel=[[RoomViewModel alloc]init];
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    conview = [[RoomCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:vmodel];
    [self.view addSubview:conview];
   
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [conview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRoom{
    
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
