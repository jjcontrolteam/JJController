//
//  LinkageNameReusableView.h
//  JJControl
//
//  Created by admin on 2018/4/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *linkageNameidentifier = @"LinkageNameReusableView";
@interface LinkageNameReusableView : UICollectionReusableView
@property(weak,nonatomic)UILabel *lbName;
@property(weak,nonatomic)UITextField *lbNameField;
- (void)setData:(NSDictionary *)data;
@end
