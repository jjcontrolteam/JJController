//
//  EditTimingViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "EditTimingViewController.h"

@interface EditTimingViewController (){
    UIView *_view1;
}

@end

@implementation EditTimingViewController

- (instancetype)init{
    if(self = [super init]){
        _currntAllTiming = [[AllTimingModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    if(self.timingType == TimingTypeAdd){
        self.title = @"添加定时";
    }else{
        self.title = @"编辑定时";
    }
    
    _view1 = [[UIView alloc] init];
    _view1.backgroundColor = [UIColor redColor];
    _view1.userInteractionEnabled = YES;
    [self.view addSubview:_view1];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view).offset(100);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@200);
    }];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(changeHeight) forControlEvents:UIControlEventTouchUpInside];
    [_view1 addSubview:button];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(_view1.mas_bottom);
        make.height.mas_equalTo(@200);
    }];

//
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(view2.mas_bottom);
        make.height.mas_equalTo(@100);
    }];
}

-(void)changeHeight{
    
    [_view1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@100);
        
    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];

    }];
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
