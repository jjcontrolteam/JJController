//
//  ModelBase.m
//  MyApplication
//
//  Created by admin on 2017/9/18.
//  Copyright © 2017年 yvanwang. All rights reserved.
//

#import "ModelBase.h"
//#import <objc/runtime.h>

@implementation ModelBase

MJExtensionCodingImplementation;    //遵守<NSCoding>协议 实现归档、解档

//json 转对象：数组里面的对象是什么
+ (NSDictionary *)mj_objectClassInArray{
    return nil;
}

//json 转对象：属性取别名
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return nil;
    
//    return @{@"userId": @"id",
//             @"nickName":@"nick_name"};
}

//有关归档、解档
- (NSData *)modelDataToSave{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

+ (instancetype)modelFromModelData:(NSData *)modelData{
    return [NSKeyedUnarchiver unarchiveObjectWithData:modelData];
}

- (BOOL)saveModelToFile:(NSString *)path{
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

+ (instancetype)modelFromFile:(NSString *)path{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}


//以下是通过 Runtime实现 不过还是没有考虑到对象里面套对象的问题
//- (void)encodeWithCoder:(NSCoder *)aCoder{
//    //目前的需求 就是获取所有的属性
//    Class cls = [self class];
//    if(cls && cls != [NSObject class]){ //保证不是 NSObject 类
//        unsigned int count = 0;
//        objc_property_t *properties = class_copyPropertyList(cls, &count);
//        for (unsigned int i = 0; i < count; i++) {
//            objc_property_t property = properties[i];
//            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
//             id value = [self valueForKey:propertyName];
//            [aCoder encodeObject:value forKey:propertyName];
//        }
//        free(properties);
//    }
//}

//- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if(self = [super init]){
//        Class cls = [self class];
//        if(cls && cls != [NSObject class]){
//            unsigned int count = 0;
//            objc_property_t *properties = class_copyPropertyList(cls, &count);
//            for (unsigned int i = 0; i < count; i++) {
//                objc_property_t property = properties[i];
//                NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
//                id value = [aDecoder decodeObjectForKey:propertyName];
//                [self setValue:value forKey:propertyName];
//            }
//        }
//    }
//    return self;
//}

@end
