//
//  BindController.m
//  JJControl
//
//  Created by admin on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "BindController.h"
#import "ServiceMgr.h"
#import "MyAlertView.h"
@interface BindController ()
{
    UITextField *idField_;
    UIButton  *enterBtn_;
    UIButton  *cancelBtn_;
    UILabel   *idLabel_;
}
@end

@implementation BindController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    idLabel_ = [[UILabel alloc]initWithFrame:CGRectMake(10, 84, 80, 45)];
    [idLabel_ setText:@"中控ID："];
    [idLabel_ setTextColor:[UIColor whiteColor]];
    [idLabel_ setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:idLabel_];
    self.title = @"手动输入";
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor =[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0];
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24]};
    [navBar setTitleTextAttributes:dict];
    
    idField_ = [[UITextField alloc]initWithFrame:CGRectMake(90,84,self.view.frame.size.width-100,45)];
   // NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
   // style.alignment = NSTextAlignmentLeft;
    //NSAttributedString *attri = [[NSAttributedString alloc] initWithString:@"请输入中控ID" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24], NSParagraphStyleAttributeName:style}];
   // idField_.attributedPlaceholder = attri;
    idField_.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 0)];
    //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
    idField_.leftViewMode = UITextFieldViewModeAlways;
    [idField_ setTextColor:[UIColor grayColor]];
    [idField_ setPlaceholder:@"请输入中控ID"];
    [idField_ setDelegate:self];
    [self.view addSubview:idField_];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(90,128,self.view.frame.size.width-100,1)];
    [self.view addSubview:line];
    [line setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    
    enterBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    enterBtn_.frame =CGRectMake(40,170,self.view.frame.size.width-80,45);
    [enterBtn_ setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    [enterBtn_ addTarget:self action:@selector(enterAction:) forControlEvents:UIControlEventTouchUpInside];
    [enterBtn_ setTitle:@"确定" forState:UIControlStateNormal];
    [enterBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [enterBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [enterBtn_.layer setCornerRadius:4];
    [enterBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:enterBtn_];
}

-(void)enterAction:(id)sender{
    ServiceMgr *service = [ServiceMgr share];
    NSString *clientid =  [[NSUserDefaults standardUserDefaults]valueForKey:@"client_id"];
    NSString *topic=@"v1/cloud/request";
    NSString *receive=[NSString stringWithFormat:@"v1/cloud/%@/response",clientid];
    NSDictionary *dict=@{@"cmd":@"1006",@"user":clientid,@"central":@"18"};
    [service sendMessage:dict withTopic:topic withResponse:receive withSuccess:^(NSDictionary *dict) {
        if ([dict objectForKey:@"code"]&&[[dict objectForKey:@"code"]integerValue]==0) {
            if ([dict objectForKey:@"cmd"]&&[[dict objectForKey:@"cmd"]integerValue]==1006
                ) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        }else{
            [MyAlertView showAlert:@"提示" message:@"绑定失败" cancelTitle:@"确定" enterTitle:nil callback:nil];
        }
        
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
