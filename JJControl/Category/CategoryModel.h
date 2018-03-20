//
//  CategoryModel.h
//  JJControl
//
//  Created by admin on 20/03/2018.
//  Copyright © 2018 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *details;

+ (instancetype)modelWithPic:(NSString *)pic title:(NSString *)title details:(NSString *)details;

@end
