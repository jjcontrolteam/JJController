//
//  UserBaseController.m
//  JJControl
//
//  Created by admin on 2018/3/13.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UserBaseController.h"
#import "MBProgressHUD.h"
#import "JJServiceInterface.h"
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface UserBaseController ()

@end

@implementation UserBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self resetView:0.0];
}
#pragma mark - 输入框代理 -

-(void)textFieldDidBeginEditing:(UITextField *)textField{   //开始编辑时，整体上移
    //计算当前cell的屏幕位置
    
    //  [genBtn_ setHidden:YES];
    // [botgenView_ setHidden:YES];
    CGRect textFieldRect =
    [self.view convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    CGFloat animatedDistance=0.0f;
    
    animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    
    [self moveView:animatedDistance];
    
}
#pragma mark-监视输入键盘是否遮挡
-(void)moveView:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect bounds = self.view.bounds;
    bounds.origin.y +=move;//view的X轴上移
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.bounds = bounds;
    [UIView commitAnimations];//设置调整界面的动画效果
}

-(void)resetView:(float)move{
    NSTimeInterval animationDuration = 0.30f;
    CGRect bounds = self.view.bounds;
    bounds.origin.y =move;//view的X轴上移
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.bounds = bounds;
    [UIView commitAnimations];//设置调整界面的动画效果
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if([string  isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        
        return NO;
    }
    NSMutableString *newtxt = [NSMutableString stringWithString:textField.text];
    [newtxt replaceCharactersInRange:range withString:string];
    if (newtxt.length > 11)
        return NO;
    
    return YES;
    
}

-(void)showHud{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hiddenHud{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)showStatus:(NSString*)msg{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud) {
        [hud.label setText:msg];
    }
}

-(void)backAction:(id)sender{
    JJServiceInterface *service = [JJServiceInterface share];
    service.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)connectFailue{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    UIView *view = [touch view];
    if(view == self.view){
        //增加监听，当键盘出现或改变时收出消息
        [self.view endEditing:YES];
    }
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
