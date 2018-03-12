//
//  JJServiceInterface.h
//  JJControl
//
//  Created by admin on 2018/3/11.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JJServiceDelegate<NSObject>
-(void)createTopicFinished;
-(void)connectFinished;
-(void)disconnect;
-(void)receiveJson:(NSDictionary*)dict;
@end
@interface JJServiceInterface : NSObject
@property(nonatomic,assign) id<JJServiceDelegate> delegate;
+ (instancetype)share;
-(void)sendMsg:(NSData*)data toTopic:(NSString*)topic;
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict;
+(NSDictionary *)jsonDictWithString:(NSString *)string;
+ (NSString *)macSignWithText:(NSString *)text secretKey:(NSString *)secretKey;
@end
