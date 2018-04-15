//
//  LinkageCollectionReusableView.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//


static NSString *headerIdentifier = @"LinkageCollectionReusableView";
typedef void(^HeaderTappedBlock)(UICollectionReusableView *reusableView);
@interface LinkageCollectionReusableView : UICollectionReusableView
@property(nonatomic,copy) HeaderTappedBlock tapBlock;
- (void)setData:(NSDictionary *)data withIndex:(NSInteger)index;

@end
