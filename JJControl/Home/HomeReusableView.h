//
//  HomeReusableView.h
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HomeSegmentChangedBlock)(NSInteger index);
typedef void(^HomeAddBlock)(NSInteger index);//0为新增场景，1为新增设备，3为新增联动
@interface HomeReusableView : UICollectionReusableView
@property (nonatomic , strong) NSString *iconName;
@property (nonatomic, copy) HomeSegmentChangedBlock segmentChangedBlock;
@property (nonatomic, copy) HomeAddBlock addBlock;
@property (nonatomic , weak)UIButton           *btnAction;
@property (nonatomic , weak) UIImageView        *iconView;
@end
