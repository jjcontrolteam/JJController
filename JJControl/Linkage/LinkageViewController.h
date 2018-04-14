//
//  LinkageViewController.h
//  JJControl
//
//  Created by YvanWang on 2018/4/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "UserBaseController.h"

typedef NS_ENUM(NSInteger, LinkageType){
    LinkageTypeAdd,
    LinkageTypeEdit
};

@interface LinkageViewController : UserBaseController

@property (nonatomic, assign) LinkageType linkageType;

@end
