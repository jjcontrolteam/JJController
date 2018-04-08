//
//  DeviceSettingController.m
//  JJControl
//
//  Created by YvanWang on 2018/3/21.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DeviceSettingController.h"
#import "DeviceSettingCollectionView.h"
#import "DeviceSettingViewModel.h"
#import "PickerViewController.h"
#import "TypeSelectViewController.h"
#import "TimingViewController.h"
#import "PickerViewModel.h"
@interface DeviceSettingController (){
    DeviceSettingCollectionView *_collectionView;
}

@end

@implementation DeviceSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设备设置";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH, 100);
    DeviceSettingViewModel *deviceSettingViewModel = [[DeviceSettingViewModel alloc] init];
    _collectionView = [[DeviceSettingCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout withViewModel:deviceSettingViewModel];
    __weak typeof(self) weakSelf = self;
    _collectionView.block = ^(DeviceSettingModel * data) {
        if(data.deviceSettingType == DeviceSettingTypeSelection || data.deviceSettingType == DeviceSettingTypeMultiSelection){
            PickerViewModel *pickerVM = [[PickerViewModel alloc] initWithTitle:data.title array:data.selectionArray];
            if(data.deviceSettingType == DeviceSettingTypeMultiSelection){
                pickerVM.pickerViewType = PickerViewTypeMulti;  //多选
            }
            PickerViewController *pickerVC = [[PickerViewController alloc] initWithViewModel:pickerVM];
            pickerVC.ensureBlock = ^(NSArray *array) {
                data.selectionArray = array;
            };
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pickerVC];
            [weakSelf presentViewController:nav animated:YES completion:nil];
            
        }else if(data.deviceSettingType == DeviceSettingTypeTitle){
            TypeSelectViewController *typeSelectVC = [[TypeSelectViewController alloc] init];
            [weakSelf.navigationController pushViewController:typeSelectVC animated:YES];
        }else if(data.deviceSettingType == DeviceSettingTypeButton){
            
        }else{
            if([data.type isEqualToString:@"timer"]){   //定时
                TimingViewController *timingVC = [[TimingViewController alloc] init];
                [weakSelf.navigationController pushViewController:timingVC animated:YES];
            }
        }
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
