//
//  BaseDataSource.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^cellBlock)(id cell , id data);
@interface BaseDataSource : NSObject<UICollectionViewDataSource>
-(instancetype)initWithItems:(NSArray *)array cellIdentifier:(NSString *)identifier andCallBack:(cellBlock)block;
@end
