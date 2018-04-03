//
//  SETTING.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SETTING : NSObject
@property(nonatomic,copy)   NSString * ID;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,copy)   NSString * KEY;
@property(nonatomic,copy)   NSString * VALUE;
@end
