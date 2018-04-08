//
//  ModelBase.h
//  MyApplication
//
//  Created by admin on 2017/9/18.
//  Copyright © 2017年 yvanwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface ModelBase : NSObject<NSCoding>

//有关解档、归档

//对象转 Data
- (NSData *)modelDataToSave;
//Data 转换为对象
+ (instancetype)modelFromModelData:(NSData *)modelData;
//保存在文件
- (BOOL)saveModelToFile:(NSString *)path;
//从文件中获取
+ (instancetype)modelFromFile:(NSString *)path;

@end
