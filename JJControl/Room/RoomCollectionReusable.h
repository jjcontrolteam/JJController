//
//  RoomCollectionReusable.h
//  JJControl
//
//  Created by admin on 2018/3/18.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^RoomSegmentChangedBlock)(NSInteger index);
@interface RoomCollectionReusable : UICollectionReusableView
@property (nonatomic, copy) RoomSegmentChangedBlock segmentChangedBlock;
@end
