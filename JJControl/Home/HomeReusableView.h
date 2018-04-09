//
//  HomeReusableView.h
//  JJControl
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HomeSegmentChangedBlock)(NSInteger index);
@interface HomeReusableView : UICollectionReusableView
@property (nonatomic , strong) NSString *iconName;
@property (nonatomic, copy) HomeSegmentChangedBlock segmentChangedBlock;
@end
