//
//  LinkageCollectionReusableView.m
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "LinkageCollectionReusableView.h"

@interface LinkageCollectionReusableView(){
    UILabel *_titleLabel;
    UIButton *_btnView;
}
@end

@implementation LinkageCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor lightGrayColor]];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
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
        make.width.height.mas_equalTo(self.mas_height).multipliedBy(0.3);
    }];

}

- (void)setData:(NSDictionary *)data withIndex:(NSInteger)index{
    if (index==0) {
        [_titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    }else if (index==2) {
        [_titleLabel setFont:[UIFont systemFontOfSize:10]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }else{
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
    }
    if([data objectForKey:@"name"]){
        _titleLabel.text = [data objectForKey:@"name"];
        [_btnView setImage:[UIImage imageNamed:@"JJControlResource.bundle/add_linkage.png"] forState:UIControlStateNormal];
    }else{
        _titleLabel.text = @"";
        [_btnView setImage:nil forState:UIControlStateNormal];
        
    }
}
-(void)btnAction:(id)sender{
    if (_tapBlock) {
        _tapBlock(self);
    }
}
@end
