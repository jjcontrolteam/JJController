//
//  BDUMD5Crypt.h
//  JJControl
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDUMD5Crypt : NSObject 
+ (NSString *)macSignWithText:(NSString *)text secretKey:(NSString *)secretKey;
@end
