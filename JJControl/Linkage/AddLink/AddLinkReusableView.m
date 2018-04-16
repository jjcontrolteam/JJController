//
//  AddLinkReusableView.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddLinkReusableView.h"
@interface AddLinkReusableView(){
    UILabel *_titleLabel;
    UIButton *_btnView;
}
@end
@implementation AddLinkReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor grayColor]];
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor lightGrayColor]];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:28];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).offset(-5);
        make.left.mas_equalTo(self).offset(CELL_LEFT_MARGIN);
        make.width.mas_equalTo(@(SCREEN_WIDTH / 2.0));
    }];
    
    _btnView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_btnView];
    [_btnView addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLabel);
        make.right.mas_equalTo(self).offset(-CELL_RIGHT_MARGIN);
        make.width.mas_equalTo(self.mas_height);
        make.height.mas_equalTo(_titleLabel);
    }];
    
}

- (void)setData:(NSDictionary *)data{
    if([data objectForKey:@"name"]){
        _titleLabel.text = [data objectForKey:@"name"];
        [_btnView setHidden:NO];
        [_btnView setHidden:YES];
    }else{
        _titleLabel.text = @"";
        [_btnView setHidden:YES];
        
    }
}
-(void)btnAction:(id)sender{
    if (_tapBlock) {
        _tapBlock(self);
    }
}
@end
