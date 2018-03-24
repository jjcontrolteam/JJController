//
//  JJServiceInterface.h
//  JJControl
//
//  Created by admin on 2018/3/11.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol JJServiceDelegate<NSObject>
@optional
- (void)connectSuccess;
- (void)showStatus:(NSString*)msg;
- (void)connectFailue;
- (void)receiveJson:(NSDictionary*)dict;
@end
@interface JJServiceInterface : NSObject
@property(nonatomic,assign) id<JJServiceDelegate> delegate;
+ (instancetype)share;
- (void)connectWithClientId:(NSString*)client_id;
- (void)sendMsg:(NSData*)data toTopic:(NSString*)topic receiveTopic:(NSString*)recieve;
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict;
+ (NSDictionary *)jsonDictWithString:(NSString *)string;
@end
