//
//  LinkageNameReusableView.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageNameReusableView.h"
@interface LinkageNameReusableView()<UITextFieldDelegate>{
    UIView *line;
}
@end
@implementation LinkageNameReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
        UILabel *tmplbName =[[UILabel alloc]init];
        [self addSubview:tmplbName];
        [tmplbName setTextAlignment:NSTextAlignmentLeft];
        [tmplbName setFont:[UIFont systemFontOfSize:16]];
        [tmplbName setTextColor:[UIColor blackColor]];
        self.lbName=tmplbName;
        
        UITextField *nameField_ = [[UITextField alloc]initWithFrame:CGRectZero];
        nameField_.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 0)];
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
        
        [nameField_ setPlaceholder:@"输入联动名称"];
        nameField_.leftViewMode = UITextFieldViewModeAlways;
        [nameField_ setTextColor:[UIColor blackColor]];
        [nameField_ setBackgroundColor:[UIColor clearColor]];
        [nameField_ setDelegate:self];
        [self addSubview:nameField_];
        self.lbNameField=nameField_;
        
        line = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:line];
        [line setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
        
        [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@2);
            make.height.mas_equalTo(@40);
            make.left.mas_equalTo(@CELL_INNER_MARGIN);
        }];
        [_lbNameField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@2);
            make.height.mas_equalTo(@40);
            make.left.mas_equalTo(_lbName.mas_right).offset(CELL_INNER_MARGIN);
            make.width.mas_equalTo(@200);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(43);
            make.left.mas_equalTo(@100);
            make.height.mas_equalTo(@1);
        }];
    }
    return self;
}
- (void)setData:(NSDictionary *)data{
    [_lbName setText:[data valueForKey:@"title"]];
    [_lbNameField setText:[data valueForKey:@"enter"]];
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
@end
