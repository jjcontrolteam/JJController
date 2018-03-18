//
//  RoomCollectionCell.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionCell.h"

@interface RoomCollectionCell(){
    UIImageView *imgView;
    UILabel  *textLabel;
    UISwitch *swithBtn;
}
@end
@implementation RoomCollectionCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(12,12, 26, 26)];
        [self addSubview:imgView];
        [imgView setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        textLabel =[[UILabel alloc]initWithFrame:CGRectMake(48, 0,200, 50)];
        [self addSubview:textLabel];
        [textLabel setTextAlignment:NSTextAlignmentLeft];
        [textLabel setFont:[UIFont systemFontOfSize:16]];
        [textLabel setTextColor:[UIColor blackColor]];
        
        swithBtn=[[UISwitch alloc]initWithFrame:CGRectMake(frame.size.width-70, 7, 56, 36)];
        [self addSubview:swithBtn];
        
        
    }
    return self;
}
-(void)fillInfo:(NSString*)txt{
    [textLabel setText:txt];
}
@end
