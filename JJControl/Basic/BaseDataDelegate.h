//
//  BaseDataDelegate.h
//  JJControl
//
//  Created by admin on 2018/3/15.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^cellDelegateBlock)(id data);
@interface BaseDataDelegate : NSObject<UICollectionViewDelegateFlowLayout>
-(instancetype)initWithItems:(NSArray *)array  andCallBack:(cellDelegateBlock)block;
@end
