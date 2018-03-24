//
//  SpanCollectionViewCell.m
//  JJControl
//
//  Created by YvanWang on 2018/3/24.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "SpanCollectionViewCell.h"

@implementation SpanCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor redColor]];
}

- (void)setCellData:(id)cellData{
    
}

@end
