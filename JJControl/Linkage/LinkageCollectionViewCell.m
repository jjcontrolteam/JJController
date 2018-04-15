//
//  LinkageCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageCollectionViewCell.h"


@interface LinkageCollectionViewCell()<UITextFieldDelegate>{
    UIView *line;
}
@end

@implementation LinkageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    
    UIImageView *tmpimgView = [[UIImageView alloc]init];
    [self.contentView addSubview:tmpimgView];
    [tmpimgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(CELL_LEFT_MARGIN);
        make.top.mas_equalTo(self.contentView).offset(CELL_TOP_MARGIN);
        make.bottom.mas_equalTo(self.contentView).offset(-CELL_BOTTOM_MARGIN);
        make.width.height.mas_equalTo(SCREEN_WIDTH / 20.0);
    }];
    self.imgView=tmpimgView;
    
    UILabel *tmplbName =[[UILabel alloc]init];
    [self.contentView addSubview:tmplbName];
    [tmplbName setTextAlignment:NSTextAlignmentLeft];
    [tmplbName setFont:[UIFont systemFontOfSize:16]];
    [tmplbName setTextColor:[UIColor blackColor]];
    self.lbName=tmplbName;
    
    UITextField *nameField_ = [[UITextField alloc]initWithFrame:CGRectZero];
    nameField_.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 4, 0)];
    //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
    nameField_.leftViewMode = UITextFieldViewModeAlways;
    [nameField_ setTextColor:[UIColor blackColor]];
    [nameField_ setBackgroundColor:[UIColor clearColor]];
    [nameField_ setDelegate:self];
    [self.contentView addSubview:nameField_];
    self.lbNameField=nameField_;
    
    line = [[UIView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:line];
    [line setBackgroundColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
    
    UILabel *tmplbLocate = [[UILabel alloc]init];
    [self.contentView addSubview:tmplbLocate];
    [tmplbLocate setTextAlignment:NSTextAlignmentLeft];
    [tmplbLocate setFont:[UIFont systemFontOfSize:16]];
    [tmplbLocate setTextColor:[UIColor blackColor]];
    self.lbLocate=tmplbLocate;
    
    [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    [_lbLocate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
    }];
    
    [_lbNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(_imgView.mas_right).offset(CELL_INNER_MARGIN);
        make.width.mas_equalTo(@200);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(-1);
        make.left.mas_equalTo(@100);
        make.height.mas_equalTo(@1);
    }];
    
    UILabel *tmplbModel =[[UILabel alloc]init];
    [self.contentView addSubview:tmplbModel];
    [tmplbModel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [tmplbModel setTextAlignment:NSTextAlignmentLeft];
    [tmplbModel setFont:[UIFont systemFontOfSize:16]];
    [tmplbModel setTextColor:[UIColor greenColor]];
    self.lbModel=tmplbModel;
    
    UILabel *tmplbState =[[UILabel alloc]init];
    [self.contentView addSubview:tmplbState];
    [tmplbState setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [tmplbState setTextAlignment:NSTextAlignmentLeft];
    [tmplbState setFont:[UIFont systemFontOfSize:16]];
    [tmplbState setTextColor:[UIColor greenColor]];
    self.lbState=tmplbState;
    
    [_lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-CELL_RIGHT_MARGIN);
    }];
    [_lbModel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(_lbState.mas_left).offset(-CELL_INNER_MARGIN);
    }];
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

