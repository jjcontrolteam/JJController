//
//  ActualTimeMode.h
//  JJControl
//
//  Created by YvanWang on 2018/4/7.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActualTimeMode : NSObject

@property (nonatomic, copy) NSString *timeTitle; //标题
@property (nonatomic, copy) NSString *time; //精准时间
@property (nonatomic, assign) BOOL isSelect;    //是否选中

+ (instancetype)modelWithTitle:(NSString *)title;

@end
