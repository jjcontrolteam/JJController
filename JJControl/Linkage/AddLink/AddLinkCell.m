//
//  AddLinkCell.m
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "AddLinkCell.h"

@implementation AddLinkCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *bkView_=[[UIView alloc]initWithFrame:CGRectMake(12, 7, 36, 36)];
        [bkView_ setBackgroundColor:[UIColor grayColor]];
        [self.contentView addSubview:bkView_];
        
        UIImageView *tmpimgView = [[UIImageView alloc]initWithFrame:CGRectMake(5,5, 26, 26)];
        [bkView_ addSubview:tmpimgView];
        self.imgView=tmpimgView;
        
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        UILabel *tmptextLabel =[[UILabel alloc]initWithFrame:CGRectMake(68, 0,200, 50)];
        [self.contentView addSubview:tmptextLabel];
        [tmptextLabel setTextAlignment:NSTextAlignmentLeft];
        [tmptextLabel setFont:[UIFont systemFontOfSize:16]];
        [tmptextLabel setTextColor:[UIColor blackColor]];
        self.textLabel=tmptextLabel;
        
    }
    return self;
}
@end
