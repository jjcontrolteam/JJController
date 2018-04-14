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
    UIImageView *_imageView;
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
    _titleLabel.font = [UIFont systemFontOfSize:28];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).offset(-5);
        make.left.mas_equalTo(self).offset(CELL_LEFT_MARGIN);
        make.width.mas_equalTo(@(SCREEN_WIDTH / 2.0));
    }];
    
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_titleLabel);
        make.right.mas_equalTo(self).offset(-CELL_RIGHT_MARGIN);
        make.width.height.mas_equalTo(self.mas_height).multipliedBy(0.3);
    }];

}

- (void)setData:(NSDictionary *)data{
    if([data objectForKey:@"name"]){
        _titleLabel.text = [data objectForKey:@"name"];
        _imageView.image = [UIImage imageNamed:@"JJControlResource.bundle/add_linkage.png"];
    }else{
        _titleLabel.text = @"";
        _imageView.image = nil;
        
    }
}

@end
