//
//  AddLinkReusableView.h
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HeaderTappedBlock)(UICollectionReusableView *reusableView);
@interface AddLinkReusableView : UICollectionReusableView
@property(nonatomic,copy) HeaderTappedBlock tapBlock;
- (void)setData:(id)data;
@end
