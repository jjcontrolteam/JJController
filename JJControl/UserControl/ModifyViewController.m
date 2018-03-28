//
//  ModifyViewController.m
//  JJControl
//
//  Created by YvanWang on 2018/3/28.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ModifyViewController.h"

@interface ModifyViewController (){
    NSString *_title;
    NSString *_currentText;
}

@end

@implementation ModifyViewController

- (instancetype)initWithTitle:(NSString *)title currentText:(NSString *)currentText{
    if(self = [super init]){
        _title = title;
        _currentText = currentText;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _title;
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(ensure)];

    UITextField *textField = [[UITextField alloc] init];
    textField.text = _currentText;
    textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(CELL_LEFT_MARGIN);
        make.right.mas_equalTo(self.view).offset(-CELL_LEFT_MARGIN);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(45);
    }];
}

- (void)ensure{
    if(self.editBlock){
        self.editBlock(@"新的字符串");
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
