//
//  DATA_VERSION.h
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DATA_VERSION : NSObject 
@property(nonatomic,assign) NSInteger  VERSION;
@property(nonatomic,assign) NSInteger  PARENT;
@property(nonatomic,copy)   NSString * TABLE;
@end
