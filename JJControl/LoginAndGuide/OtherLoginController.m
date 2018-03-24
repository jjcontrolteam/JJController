//
//  OtherLoginController.m
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "OtherLoginController.h"
@interface OtherLoginController ()<UITextFieldDelegate>
{
    UITextField *telField_;
    UITextField *verField_;
    
    UIButton  *loginBtn_;
    UIButton  *fetchBtn_;
    UIButton  *backBtn_;
}
@end

@implementation OtherLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *viewbk=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [viewbk setImage:[UIImage imageNamed:@"JJControlResource.bundle/BKEffect.png"]];
    [self.view addSubview:viewbk];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = self.view.bounds;
    [viewbk addSubview:effectview];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40 , 40)];
    [btn.widthAnchor constraintEqualToConstant:40].active = YES;
    [btn.heightAnchor constraintEqualToConstant:40].active = YES;
    [btn setImage:[UIImage imageNamed:@"JJControlResource.bundle/button_dsyk_back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, self.view.frame.size.height/2-110, CGRectGetWidth(self.view.frame)-80, 30)];
    [titleLabel setText:@"Welcome"];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setNumberOfLines:0];
    [titleLabel setFont:[UIFont systemFontOfSize:22]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleLabel];
    
    UILabel *content = [[UILabel alloc]initWithFrame:CGRectMake(40, self.view.frame.size.height/2-80, CGRectGetWidth(self.view.frame)-80, 80)];
    [content setText:@"Internet of things will change the world at the turn of this century"];
    [content setTextColor:[UIColor whiteColor]];
    [content setNumberOfLines:0];
    [content setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:content];
    
    
    telField_ = [[UITextField alloc]initWithFrame:CGRectMake(40,self.view.frame.size.height/2,self.view.frame.size.width-80,45)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:22], NSParagraphStyleAttributeName:style}];
    telField_.attributedPlaceholder = attri;
    [telField_ setDelegate:self];
    [telField_ setBackgroundColor:[UIColor clearColor]];
    [telField_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [telField_.layer setBorderWidth:1];
    [telField_.layer setCornerRadius:4];
    [telField_.layer setMasksToBounds:YES];
    [self.view addSubview:telField_];
    
    
    verField_ = [[UITextField alloc]initWithFrame:CGRectMake(40,self.view.frame.size.height/2+60,self.view.frame.size.width-210,45)];
    NSAttributedString *attri1 = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:22], NSParagraphStyleAttributeName:style}];
    verField_.attributedPlaceholder = attri1;
    [verField_ setBackgroundColor:[UIColor clearColor]];
    [verField_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [verField_.layer setBorderWidth:1];
    [verField_.layer setCornerRadius:4];
    [verField_.layer setMasksToBounds:YES];
    [verField_ setDelegate:self];
    [self.view addSubview:verField_];
    
    fetchBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    fetchBtn_.frame =CGRectMake(self.view.frame.size.width-160,self.view.frame.size.height/2+60,120,45);
    [fetchBtn_ setBackgroundColor:[UIColor clearColor]];
    [fetchBtn_ addTarget:self action:@selector(fetchAction:) forControlEvents:UIControlEventTouchUpInside];
    [fetchBtn_ setTitle:@"获取" forState:UIControlStateNormal];
    [fetchBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fetchBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [fetchBtn_.layer setBorderWidth:1.0];
    [fetchBtn_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [fetchBtn_.layer setCornerRadius:4];
    [fetchBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:fetchBtn_];
    
    loginBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn_.frame =CGRectMake(40,self.view.frame.size.height/2+120,self.view.frame.size.width-80,50);
    [loginBtn_ setBackgroundColor:[UIColor lightGrayColor]];
    [loginBtn_ addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn_ setTitle:@"登陆体验账号" forState:UIControlStateNormal];
    [loginBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [loginBtn_.layer setCornerRadius:8];
    [loginBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:loginBtn_];
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loginAction:(id)sender{
    
}

- (void)fetchAction:(id)sender{
    
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
