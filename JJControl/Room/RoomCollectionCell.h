//
//  RoomCollectionCell.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ROOM;
@interface RoomCollectionCell : UICollectionViewCell
- (void)fillInfo:(ROOM*)model;
@end
