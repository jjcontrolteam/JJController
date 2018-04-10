//
//  HomeCollectionCell.m
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "HomeCollectionCell.h"
#import "DEVICE.h"
#import "LINKAGE.h"
#import "SCENE.h"
@interface HomeCollectionCell(){
    UIImageView *imgView;
    UIView *bkView_;
    UILabel  *textLabel;
    UISwitch *swithBtn;
    UILabel  *switchLabel;
}
@end
@implementation HomeCollectionCell
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
        
        swithBtn=[[UISwitch alloc]initWithFrame:CGRectMake(frame.size.width-70, 7, 56, 36)];
        [self addSubview:swithBtn];
        
        switchLabel =[[UILabel alloc]initWithFrame:CGRectMake(frame.size.width-70, 7, 56, 36)];
        [self.contentView addSubview:switchLabel];
        [switchLabel setTextAlignment:NSTextAlignmentLeft];
        [switchLabel setFont:[UIFont systemFontOfSize:16]];
        [switchLabel setTextColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
        
    }
    return self;
}
- (void)fillInfo:(id)model{
    [imgView setHidden:NO];
    [bkView_ setHidden:NO];
    if ([model isKindOfClass:[DEVICE class]]) {
        DEVICE *device=(DEVICE*)model;
        [textLabel setText:device.NAME];
        NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",device.iconPath];
        [imgView setImage:[UIImage imageNamed:imgname]];
      //  float color= device.TYPE /1000.0f;
        
        if (device.ENABLE==0) {
            [switchLabel setText:@"无人"];
            [switchLabel setHidden:NO];
            [swithBtn setHidden:YES];
            [bkView_ setBackgroundColor:[UIColor colorWithRed:0.5882 green:0.7843 blue:0.8353 alpha:1.0]];
        }else{
            if (device.roomId==0) {
                [switchLabel setText:@"Offine"];
                [switchLabel setHidden:NO];
                [swithBtn setHidden:YES];
                [bkView_ setBackgroundColor:[UIColor colorWithRed:0.5882 green:0.7843 blue:0.8353 alpha:1.0]];
            }else{
                [swithBtn setOn:YES];
                [swithBtn setHidden:NO];
                [switchLabel setHidden:YES];
                [bkView_ setBackgroundColor:[UIColor colorWithRed:0.2196 green:0.6549 blue:0.7961 alpha:1.0]];
            }
        }
    }else if ([model isKindOfClass:[SCENE class]]) {
        SCENE *scene=(SCENE*)model;
        [textLabel setText:scene.NAME];
        NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",scene.iconPath];
        [imgView setImage:[UIImage imageNamed:imgname]];
       // float color= scene.TYPE /1000.0f;
        if (scene.isStop==0) {
            [switchLabel setHidden:YES];
            [swithBtn setHidden:YES];
            [swithBtn setOn:NO];
            [bkView_ setBackgroundColor:[UIColor colorWithRed:0.5882 green:0.7843 blue:0.8353 alpha:1.0]];
        }else{
            [swithBtn setHidden:NO];
            [swithBtn setOn:YES];
            [switchLabel setHidden:YES];
            [bkView_ setBackgroundColor:[UIColor colorWithRed:0.2196 green:0.6549 blue:0.7961 alpha:1.0]];
        }
       
    }else{
        LINKAGE *link=(LINKAGE*)model;
        [textLabel setText:link.NAME];
      /*  NSString *imgname=[NSString stringWithFormat:@"JJControlResource.bundle/%@.png",link.iconPath];
        [imgView setImage:[UIImage imageNamed:imgname]];
        float color= link.TYPE /1000.0f;
        [bkView_ setBackgroundColor:[UIColor colorWithRed:color green:0.3 blue:(1-color) alpha:1.0]];*/
        [imgView setHidden:YES];
        [bkView_ setHidden:YES];
        [switchLabel setHidden:YES];
        [swithBtn setHidden:YES];
    }
    
  /* */
}
@end
