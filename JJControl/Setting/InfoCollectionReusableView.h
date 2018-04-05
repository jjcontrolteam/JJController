//
//  InfoCollectionReusableView.h
//  JJControl
//
//  Created by YvanWang on 2018/4/6.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TappedBlock)(NSInteger index);
 
@interface InfoCollectionReusableView : UICollectionReusableView

@property (nonatomic, copy) TappedBlock tappedBlock;


@end
