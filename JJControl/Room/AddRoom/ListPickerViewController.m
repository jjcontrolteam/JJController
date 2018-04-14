//
//  ListPickerViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/4/10.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ListPickerViewController.h"
#import "ROOM.h"

@interface ListPickerViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>{
    NSArray *_array;
    UIView *_listPickerView;
    NSString *_title;
    NSMutableArray *_currentRows;
}

@end

@implementation ListPickerViewController

- (instancetype)initWithTitle:(NSString *)title withItems:(NSArray *)items currentRows:(NSArray *)currentRows{
    if(self = [super init]){
        _title = title;
        _currentRows = [[NSMutableArray alloc] init];
        for (NSInteger i = 0 ; i < currentRows.count; i++) {
            [_currentRows addObject:currentRows[i]];
        }
        _isMulti = NO;
        _array = [[NSMutableArray alloc]initWithArray:items];
    }
    
    return self;
}

+ (instancetype)pickerWithTitle:(NSString *)title withItems:(NSArray *)items currentRows:(NSArray *)currentRows{
    ListPickerViewController *pickerVC = [[[self class] alloc] initWithTitle:title withItems:items currentRows:currentRows];
    pickerVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    return pickerVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _listPickerView = [[UIView alloc] init];
    _listPickerView.backgroundColor =  [UIColor whiteColor];
    [self.view addSubview:_listPickerView];
    [_listPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@(250));
        make.bottom.mas_equalTo(self.view);
    }];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [_listPickerView addSubview:pickerView];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(_listPickerView);
        make.height.mas_equalTo(@(200));
    }];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor blueColor];
    [_listPickerView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(_listPickerView);
        make.height.mas_equalTo(@50);
    }];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(cancelButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(topView);
        make.width.mas_equalTo(@100);
    }];
    
    UIButton *ensureButton = [[UIButton alloc] init];
    [ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    ensureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [ensureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ensureButton addTarget:self action:@selector(ensureButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:ensureButton];
    [ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(topView);
        make.width.mas_equalTo(@100);
    }];
    if(_isMulti){
        for (NSInteger i = 0; i < _array.count; i++) {
            [pickerView selectRow:[_currentRows[i] integerValue] inComponent:i animated:YES];
        }
    }else{
        [pickerView selectRow:[_currentRows[0] integerValue] inComponent:0 animated:YES];
    }
}
 
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return _isMulti ? _array.count : 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _isMulti ? [[_array objectAtIndex:component] count]  : _array.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _isMulti ? [[_array objectAtIndex:component] objectAtIndex:row] : [_array objectAtIndex:row];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    UIView *view = [touch view];
    if(view == self.view){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _currentRows[component] = @(row);
}

- (void)cancelButtonTapped{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ensureButtonTapped{
    if(self.selectedBlock){
        self.selectedBlock(_currentRows);
    }
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
