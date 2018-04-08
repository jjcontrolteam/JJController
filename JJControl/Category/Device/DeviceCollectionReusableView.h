//
//  DeviceCollectionReusableView.h
//  JJControl
//
//  Created by YvanWang on 2018/3/20.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SegmentChangedBlock)(NSInteger index);

@interface DeviceCollectionReusableView : UICollectionReusableView

@property (nonatomic, copy) SegmentChangedBlock segmentChangedBlock;

- (void)setCellData:(id)data;
 
@end
