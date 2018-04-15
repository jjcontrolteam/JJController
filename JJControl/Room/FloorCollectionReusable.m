//
//  FloorCollectionReusable.m
//  JJControl
//
//  Created by admin on 2018/3/18.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "FloorCollectionReusable.h"
@interface FloorCollectionReusable(){
    
//    UISegmentedControl *segmentCtrl;
}
@end
@implementation FloorCollectionReusable
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    [self setBackgroundColor:[UIColor lightGrayColor]];
    UILabel *tmpfloorLabel = [[UILabel alloc] init];
    tmpfloorLabel.textColor = [UIColor grayColor];
    tmpfloorLabel.font = [UIFont systemFontOfSize:25];
    tmpfloorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:tmpfloorLabel];
    self.floorLabel=tmpfloorLabel;
    
    [tmpfloorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(CELL_LEFT_MARGIN);
        make.width.mas_equalTo(@(SCREEN_WIDTH / 2.0));
    }];
    
    UILabel *tmpdetailsLabel = [[UILabel alloc] init];
    tmpdetailsLabel.textColor = [UIColor grayColor];
    tmpdetailsLabel.textAlignment = NSTextAlignmentRight;
    tmpdetailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    tmpdetailsLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:tmpdetailsLabel];
    self.detailsLabel=tmpdetailsLabel;
    
    [tmpdetailsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(-CELL_LEFT_MARGIN);
        make.width.mas_equalTo(@(SCREEN_WIDTH / 2.0));
    }];
}

 



//        imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-44)];
//
//        [imgView setImage:[UIImage imageNamed:@"JJControlResource.bundle/room_image_0.jpg"]];
//
//        [self addSubview:imgView];
//
//        segmentCtrl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(14, CGRectGetMaxY(imgView.frame)+5, frame.size.width-28, 34)];
//        [self addSubview:segmentCtrl];
//
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
//        [segmentCtrl setTitleTextAttributes:dic forState:UIControlStateSelected];
//
//        [segmentCtrl insertSegmentWithTitle:@"设备" atIndex:1 animated:NO];
//        [segmentCtrl insertSegmentWithTitle:@"场景" atIndex:2 animated:NO];
//        [segmentCtrl insertSegmentWithTitle:@"联动" atIndex:3 animated:NO];
//        [segmentCtrl setTintColor:[UIColor colorWithRed:0.2471 green:0.6706 blue:0.4196 alpha:1.0]];
//        [segmentCtrl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
//

//-(void)change:(UISegmentedControl *)sender{
//    if (_segmentChangedBlock) {
//        _segmentChangedBlock(sender.selectedSegmentIndex);
//    }
//}
@end
