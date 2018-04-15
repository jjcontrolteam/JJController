//
//  FloorCollectionReusable.h
//  JJControl
//
//  Created by admin on 2018/3/18.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *floorReusableindentifer=@"FloorCollectionReusable";

//typedef void(^RoomSegmentChangedBlock)(NSInteger index);
@interface FloorCollectionReusable : UICollectionReusableView
//@property (nonatomic, copy) RoomSegmentChangedBlock segmentChangedBlock;
@property(weak,nonatomic) UILabel *floorLabel;
@property(weak,nonatomic) UILabel *detailsLabel;

@end
