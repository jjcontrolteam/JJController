//
//  RoomCollectionCell.m
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "RoomCollectionCell.h"
#import "ROOM.h"
@interface RoomCollectionCell(){
    UIImageView *imgView;
    UIView *bkView_;
    UILabel  *textLabel;
    UISwitch *swithBtn;
}
@end
@implementation RoomCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bkView_=[[UIView alloc]initWithFrame:CGRectMake(12, 7, 36, 36)];
        [bkView_ setBackgroundColor:[UIColor grayColor]];
        [self.contentView addSubview:bkView_];
        
        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5,5, 26, 26)];
        [bkView_ addSubview:imgView];
        [imgView setImage:[UIImage imageNamed:@"JJControlResource.bundle/icon_cj_ys_on.png"]];
        
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        textLabel =[[UILabel alloc]initWithFrame:CGRectMake(68, 0,200, 50)];
        [self.contentView addSubview:textLabel];
        [textLabel setTextAlignment:NSTextAlignmentLeft];
        [textLabel setFont:[UIFont systemFontOfSize:16]];
        [textLabel setTextColor:[UIColor blackColor]];
        
      //  swithBtn=[[UISwitch alloc]initWithFrame:CGRectMake(frame.size.width-70, 7, 56, 36)];
       // [self addSubview:swithBtn];
        
        
    }
    return self;
}
- (void)fillInfo:(ROOM*)model{
    [textLabel setText:model.NAME];
    NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",model.iconPath];
    [imgView setImage:[UIImage imageNamed:imgname]];
    float color= model.TYPE /10.0f;
    [bkView_ setBackgroundColor:[UIColor colorWithRed:color green:0.3 blue:(1-color) alpha:1.0]];
}
@end
