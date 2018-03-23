//
//  DBHelper.m
//  JJControl
//
//  Created by admin on 2018/3/23.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "DBHelper.h"
#import "JRDB.h"
#import "CategoryModel.h"
@implementation DBHelper
-(void)test{
   // [JRDBMgr shareInstance]create
    CategoryModel *model =[[CategoryModel alloc]init];
    [model setID:@""];
}
@end
