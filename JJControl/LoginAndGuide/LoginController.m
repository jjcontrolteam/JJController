//
//  LoginController.m
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"
#import "OtherLoginController.h"
#import "MainTabBarController.h"
#import "ViewController.h"
#import "JJServiceInterface.h"

#import "BDUMD5Crypt.h"
#import<CommonCrypto/CommonDigest.h>

#define KEY_MAC     @"gaoyusong"
#define encryptKey  @"HmacMD5"

@interface LoginController ()<UITextFieldDelegate,JJServiceDelegate>
{
    UITextField *nameField_;
    UITextField *pwdField_;
    
    UIButton  *loginBtn_;
    UIButton  *registerBtn_;
    UIButton  *loginOtherBtn_;
    UIButton  *forgetBtn_;
}
@end

@implementation LoginController

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
    
    
    nameField_ = [[UITextField alloc]initWithFrame:CGRectMake(40,self.view.frame.size.height/2,self.view.frame.size.width-80,45)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"账号" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24], NSParagraphStyleAttributeName:style}];
    nameField_.attributedPlaceholder = attri;
    nameField_.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 0)];
    //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
    nameField_.leftViewMode = UITextFieldViewModeAlways;
    [nameField_ setTextColor:[UIColor whiteColor]];
    [nameField_ setBackgroundColor:[UIColor clearColor]];
    [nameField_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [nameField_.layer setBorderWidth:1];
    [nameField_.layer setCornerRadius:4];
    [nameField_.layer setMasksToBounds:YES];
    [nameField_ setDelegate:self];
    [self.view addSubview:nameField_];
    
    
    pwdField_ = [[UITextField alloc]initWithFrame:CGRectMake(40,self.view.frame.size.height/2+60,self.view.frame.size.width-80,45)];
    NSAttributedString *attri1 = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24], NSParagraphStyleAttributeName:style}];
    pwdField_.attributedPlaceholder = attri1;
    pwdField_.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 0)];
    //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
    pwdField_.leftViewMode = UITextFieldViewModeAlways;
    [pwdField_ setTextColor:[UIColor whiteColor]];
    [pwdField_ setBackgroundColor:[UIColor clearColor]];
    [pwdField_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [pwdField_.layer setBorderWidth:1];
    [pwdField_.layer setCornerRadius:4];
    [pwdField_.layer setMasksToBounds:YES];
    [pwdField_ setDelegate:self];
    [self.view addSubview:pwdField_];
    
    loginBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn_.frame =CGRectMake(40,self.view.frame.size.height/2+120,self.view.frame.size.width-80,45);
    [loginBtn_ setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    [loginBtn_ addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn_ setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [loginBtn_.layer setCornerRadius:4];
    [loginBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:loginBtn_];
    
    
    registerBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn_.frame =CGRectMake(53,self.view.frame.size.height/2+170,40,35);
    [registerBtn_ setBackgroundColor:[UIColor clearColor]];
    [registerBtn_ addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn_ setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:registerBtn_];
    [registerBtn_ setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    
    loginOtherBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    loginOtherBtn_.frame =CGRectMake(93,self.view.frame.size.height/2+170,150,35);
    [loginOtherBtn_ setBackgroundColor:[UIColor clearColor]];
    [loginOtherBtn_ addTarget:self action:@selector(loginOtherAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginOtherBtn_ setTitle:@"|  登陆体验账号  |" forState:UIControlStateNormal];
    [loginOtherBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginOtherBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:loginOtherBtn_];
    
    
    forgetBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn_.frame =CGRectMake(243,self.view.frame.size.height/2+170,120,35);
    [forgetBtn_ setBackgroundColor:[UIColor clearColor]];
    [forgetBtn_ addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [forgetBtn_ setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:forgetBtn_];
    [forgetBtn_ setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self resetView:0.0];
}

- (void)loginAction:(id)sender{
    
//    //直接跳转到首页进行测试
//    MainTabBarController *mainTabBarController = [[MainTabBarController alloc] init];
//    [self.navigationController pushViewController:mainTabBarController animated:YES];
//    

    if ([nameField_.text length]<1||[pwdField_.text length]<1) {
        return;
    }

    JJServiceInterface *service = [JJServiceInterface share];
    service.delegate = self;
    [service connectWithClientId:nameField_.text];
    [self showHud];
    
}

- (void)connectSuccess{
    JJServiceInterface *service = [JJServiceInterface share];
    NSString *result =[BDUMD5Crypt macSignWithText:pwdField_.text secretKey:KEY_MAC] ;
    NSString *str=[NSString stringWithFormat:@"{\"cmd\": 1003,\"user\": \"%@\",\"password\": \"%@\"}" ,nameField_.text, result];
    NSString *receive=[NSString stringWithFormat:@"v1/cloud/%@/response",nameField_.text];
    [service sendMsg:[str dataUsingEncoding:NSUTF8StringEncoding] toTopic:@"v1/cloud/request" receiveTopic:receive];
}
- (void)loginOtherAction:(id)sender{
    OtherLoginController *login=[[OtherLoginController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}

- (void)registerAction:(id)sender{
    RegisterController *registerCtrl = [[RegisterController alloc]init];
    [self.navigationController pushViewController:registerCtrl animated:YES];
}



- (void)receiveJson:(NSDictionary*)dict
{
    
    [self hiddenHud];
     NSLog(@"%@",dict);
    if([[dict valueForKey:@"code"]integerValue]==0 && [[dict valueForKey:@"cmd"]integerValue]==1003)
    {
        MainTabBarController *mainTabbarController = [[MainTabBarController alloc] init];
        [self.navigationController pushViewController:mainTabbarController animated:YES];
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
