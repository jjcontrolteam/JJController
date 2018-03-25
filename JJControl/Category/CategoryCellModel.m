//
//  CategoryModel.m
//  JJControl
//
//  Created by admin on 20/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import "CategoryCellModel.h"

@implementation CategoryCellModel

- (instancetype)initWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details{
    if(self = [super init]){
        _pic = pic;
        _title = title;
        _details = details;
    }
    return self;
}

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details{
    return [[self alloc] initWithPic:pic title:title details:details];
}


@end
