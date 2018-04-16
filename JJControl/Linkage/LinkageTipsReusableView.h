//
//  LinkageTipsReusableView.h
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *linkagetipsidentifier = @"LinkageTipsReusableView";
@interface LinkageTipsReusableView : UICollectionReusableView
@property(weak,nonatomic)UILabel *lbName;
- (void)setData:(NSDictionary *)data;
@end
