//
//  JJServiceInterface.m
//  JJControl
//
//  Created by admin on 2018/3/11.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "JJServiceInterface.h"
#import "MQTTClient.h"

static JJServiceInterface * _singleton;
@interface JJServiceInterface()<MQTTSessionDelegate>{
    MQTTSession *session;
}
@end


@implementation JJServiceInterface
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    // 一次函数
    dispatch_once(&onceToken, ^{
        if (_singleton == nil) {
            _singleton = [super allocWithZone:zone];
        }
    });
    
    return _singleton;
}

+ (instancetype)share{
    
    return  [[self alloc] init];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
        
        
        MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
        
        transport.host = @"106.14.200.212";
        
        transport.port = 1883 ;
        
       // transport.voip=YES;
        
        session = [[MQTTSession alloc] init];
        
       // session.voip = YES;
        
        session.transport = transport;
        
        session.delegate = self;
        
        [session connectAndWaitTimeout:1];
        
        
    }
   
    return self;
}

-(void)connected:(MQTTSession *)session{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self class] subScribeTopic:session toTopic:@"v1/cloud/request" callback:^(bool success) {
                if (success) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                    if (_delegate && [_delegate respondsToSelector:@selector(createTopicFinished)]) {
                        [_delegate createTopicFinished];
                    }});
                }
            }];
          
            
        });
    });
}
//连接成功
- (void)handleEvent:(MQTTSession *)session event:(MQTTSessionEvent)eventCode error:(NSError *)error
{
    switch (eventCode) {
        case MQTTSessionEventConnected:
        {
           
        }
            break;
            
        default:
            break;
    }
}

- (void)newMessage:(MQTTSession *)session
              data:(NSData *)data
           onTopic:(NSString *)topic
               qos:(MQTTQosLevel)qos
          retained:(BOOL)retained
               mid:(unsigned int)mid {
    // this is one of the delegate callbacks
  /*  if (data) {
        NSString *val = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        if (val) {
           NSDictionary *dict =  [[self class]jsonDictWithString:val];
            if (_delegate && [_delegate respondsToSelector:@selector(receiveJson:)]) {
                [_delegate receiveJson:dict];
            }
        }
    }*/
}

-(void)sendMsg:(NSData*)data toTopic:(NSString*)topic{
 /*   [session publishAndWaitData:data
                        onTopic:topic
                         retain:NO
                            qos:MQTTQosLevelExactlyOnce];*/
    
}

+(void)subScribeTopic:(MQTTSession*)msession toTopic:(NSString*)topic callback:(void (^)(bool success))completion{
    [msession subscribeToTopics:@{
                                 @"v1/cloud/request": @(0),
                                 @"13911112222": @(1),
                                 @"v1/cloud/13911112222/response": @(2)
                                 } subscribeHandler:^(NSError *error, NSArray<NSNumber *> *gQoss){
                                     if (error) {
                                         completion(NO);
                                     } else {
                                         completion(YES);
                                     }
                               
                                }];
   /*  [msession subscribeToTopic:topic atLevel:MQTTQosLevelExactlyOnce subscribeHandler:^(NSError *error, NSArray<NSNumber *> *gQoss){
         if (error) {
             completion(NO);
         } else {
             completion(YES);
         }
    }];*/
}

// json字符串转dict字典
+(NSDictionary *)jsonDictWithString:(NSString *)string
{
    if (string && 0 != string.length)
    {
        NSError *error;
        NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if (error)
        {
            NSLog(@"json解析失败：%@", error);
            return nil;
        }
        
        return jsonDict;
    }
    
    return nil;
}
// dict字典转json字符串
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict
{
    if (dict && 0 != dict.count)
    {
        NSError *error = nil;
        // NSJSONWritingOptions 是"NSJSONWritingPrettyPrinted"的话有换位符\n；是"0"的话没有换位符\n。
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    
    return nil;
}

 
@end
