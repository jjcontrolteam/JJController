//
//  AddRoomViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddRoomViewController.h"
#import "ListPickerViewController.h"
#import "ROOM.h"

#define FLOOR_ITEMS @[@"1",@"2",@"3",@"4",@"5"]
#define ROOM_ICONS @[@"JJControlResource.bundle/icon_sb_ktsd.png",@"JJControlResource.bundle/icon_sb_ktsd.png",@"JJControlResource.bundle/icon_sb_ktld.png",@"JJControlResource.bundle/icon_sb_ktdd.png"]
#define ROOM_NAMES @[@"默认",@"卧室",@"客厅",@"书房"]


@interface AddRoomViewController (){
    UITextField *_homeNameField;
    UILabel *_floor;
    UIImageView *_iconImage;
    ROOM *_room;
    NSInteger _currentIconRow, _currentFloorRow;
    
}

@end

@implementation AddRoomViewController

- (instancetype)init{
    if([super init]){
        _room = [[ROOM alloc] init];
        _currentIconRow = 0;
        _currentFloorRow = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _room.iconPath = [ROOM_ICONS objectAtIndex:0];
    _room.NAME = [ROOM_NAMES objectAtIndex:0];
    _room.FLOOR = [[FLOOR_ITEMS objectAtIndex:0] integerValue];
    
    self.title = @"添加房间";

    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensure)];
    //房间图标
    UILabel *homeIconLabel = [[UILabel alloc] init];
    homeIconLabel.text = @"房间图标";
    homeIconLabel.textColor = [UIColor blackColor];
    [self.view addSubview:homeIconLabel];
    [homeIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(@100);
        make.left.mas_equalTo(self.view).offset(CELL_TOP_MARGIN);
        make.top.mas_equalTo(@70);
    }];
    
    _iconImage = [[UIImageView alloc] init];
    [self.view addSubview:_iconImage];
    _iconImage.backgroundColor = [UIColor redColor];
    _iconImage.image = [UIImage imageNamed:_room.iconPath];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(homeIconLabel.mas_right);
        make.top.bottom.mas_equalTo(homeIconLabel);
        make.width.mas_equalTo(homeIconLabel.mas_height);
    }];
    
    UIButton *homeIconButton = [[UIButton alloc] init];
    [self.view addSubview:homeIconButton];
    [homeIconButton addTarget:self action:@selector(homeIconButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [homeIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(homeIconLabel);
        make.left.right.mas_equalTo(self.view);
    }];
    
    //房间名称
    UILabel *homeNameLabel = [[UILabel alloc] init];
    homeNameLabel.text = @"添加房间";
    homeNameLabel.textColor = [UIColor blackColor];
    [self.view addSubview:homeNameLabel];
    [homeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(homeIconLabel);
        make.top.mas_equalTo(homeIconLabel.mas_bottom);
        make.left.mas_equalTo(homeIconLabel);
    }];
    
    _homeNameField = [[UITextField alloc] init];
    _homeNameField.text = _room.NAME;
    _homeNameField.placeholder = @"请输入名称";
    [self.view addSubview:_homeNameField];
    [_homeNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(homeIconLabel.mas_right);
        make.top.bottom.mas_equalTo(homeNameLabel);
        make.right.mas_equalTo(self.view).offset(-CELL_RIGHT_MARGIN);
    }];
    
    UIButton *homeNameButton = [[UIButton alloc] init];
    [self.view addSubview:homeNameButton];
    [homeNameButton addTarget:self action:@selector(homeNameButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [homeNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(homeNameLabel);
        make.left.right.mas_equalTo(self.view);
    }];

    
    //楼层选择
    UILabel *floorLabel = [[UILabel alloc] init];
    floorLabel.text = @"楼层选择";
    floorLabel.textColor = [UIColor blackColor];
    [self.view addSubview:floorLabel];
    [floorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(homeIconLabel);
        make.top.mas_equalTo(homeNameLabel.mas_bottom);
        make.left.mas_equalTo(homeIconLabel);
    }];
    
    _floor = [[UILabel alloc] init];
    _floor.text = [NSString stringWithFormat:@"F%@",@(_room.FLOOR)];
    [self.view addSubview:_floor];
    [_floor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(homeIconLabel.mas_right);
        make.top.bottom.mas_equalTo(floorLabel);
        make.right.mas_equalTo(@(SCREEN_WIDTH / 2));
    }];

    UIButton *floorButton = [[UIButton alloc] init];
    [self.view addSubview:floorButton];
    [floorButton addTarget:self action:@selector(floorButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [floorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(floorLabel);
        make.left.right.mas_equalTo(self.view);
    }];
}

- (void)homeIconButtonTapped{
    ListPickerViewController *listPickerVC = [ListPickerViewController pickerWithTitle:nil withItems:ROOM_NAMES currentRow:_currentIconRow];
    listPickerVC.selectedBlock = ^(NSInteger index) {
        _currentIconRow = index;
        _room.iconPath = [ROOM_ICONS objectAtIndex:index];
        _iconImage.image = [UIImage imageNamed:_room.iconPath];
        _homeNameField.text = [ROOM_NAMES objectAtIndex:index];
    };
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UINavigationController *nav=(UINavigationController *)window.rootViewController;
    [nav presentViewController:listPickerVC animated:YES completion:nil];
}

- (void)floorButtonTapped{
    ListPickerViewController *listPickerVC = [ListPickerViewController pickerWithTitle:nil withItems:FLOOR_ITEMS currentRow:_currentFloorRow];
    listPickerVC.selectedBlock = ^(NSInteger index) {
        _currentFloorRow = index;
        _room.FLOOR = [[FLOOR_ITEMS objectAtIndex:index] integerValue];
        _floor.text = [NSString stringWithFormat:@"F%@",@(_room.FLOOR)];
    };
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UINavigationController *nav=(UINavigationController *)window.rootViewController;
    [nav presentViewController:listPickerVC animated:YES completion:nil];
}

- (void)homeNameButtonTapped{
    [_homeNameField becomeFirstResponder];
}

- (void)ensure{
    _room.NAME = _homeNameField.text;
    [self.navigationController popViewControllerAnimated:YES];
    if(self.addRoomBlock){
        self.addRoomBlock(_room);
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
