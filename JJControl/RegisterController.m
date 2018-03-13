//
//  RegisterController.m
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()
{
    UITextField *nameField_;
    UITextField *pwdField_;
    UITextField *doublePwdField_;
    UIButton  *registerBtn_;
}
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1.0]];
    [self.navigationController setNavigationBarHidden:NO];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor =[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0];
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24]};
    [navBar setTitleTextAttributes:dict];
    
    self.title = @"用户注册";
    
    nameField_ = [[UITextField alloc]initWithFrame:CGRectMake(20,80,self.view.frame.size.width-40,45)];
    UIImageView *rightView = [[UIImageView alloc]initWithFrame:CGRectMake(4, 0, 24, 24)];
    rightView.image =[UIImage imageNamed:@"JJControlResource.bundle/icon_admin.png"];
    nameField_.leftView = rightView;
    nameField_.leftViewMode = UITextFieldViewModeAlways;
    nameField_.borderStyle=UITextBorderStyleRoundedRect;
    nameField_.placeholder=@"请输入11未手机号码";
    [nameField_ setDelegate:self];
    [self.view addSubview:nameField_];
    
    
    pwdField_ = [[UITextField alloc]initWithFrame:CGRectMake(20,140,self.view.frame.size.width-40,45)];
    UIImageView *rightView1 = [[UIImageView alloc]initWithFrame:CGRectMake(4, 0, 24, 24)];
    rightView1.image =[UIImage imageNamed:@"JJControlResource.bundle/icon_mm.png"];
    pwdField_.leftView = rightView1;
    pwdField_.leftViewMode = UITextFieldViewModeAlways;
    pwdField_.borderStyle=UITextBorderStyleRoundedRect;
    pwdField_.placeholder=@"请输入密码";
    [pwdField_ setDelegate:self];
    [self.view addSubview:pwdField_];
    
    doublePwdField_ = [[UITextField alloc]initWithFrame:CGRectMake(20,200,self.view.frame.size.width-40,45)];
    UIImageView *rightView2 = [[UIImageView alloc]initWithFrame:CGRectMake(4, 0, 24, 24)];
    rightView2.image =[UIImage imageNamed:@"JJControlResource.bundle/icon_mm.png"];
    doublePwdField_.leftView = rightView2;
    doublePwdField_.leftViewMode = UITextFieldViewModeAlways;
    doublePwdField_.borderStyle=UITextBorderStyleRoundedRect;
    doublePwdField_.placeholder=@"请再次输入密码";
    [doublePwdField_ setDelegate:self];
    [self.view addSubview:doublePwdField_];
    
    
    registerBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn_.frame =CGRectMake(20,270,self.view.frame.size.width-40,50);
    [registerBtn_ setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    [registerBtn_ addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn_ setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [registerBtn_.layer setCornerRadius:4];
    [registerBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:registerBtn_];
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(20,325, CGRectGetWidth(self.view.frame)-40, 60)];
    [content setText:@"您的账号将会同时用于短信验证，报警，找回密码，请务必输入正确常用的手机号码"];
    [content setTextColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:content];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40 , 40)];
    [btn.widthAnchor constraintEqualToConstant:40].active = YES;
    [btn.heightAnchor constraintEqualToConstant:40].active = YES;
    [btn setImage:[UIImage imageNamed:@"JJControlResource.bundle/button_dsyk_back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barButton;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)registerAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
