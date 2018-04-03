//
//  JJServiceInterface.m
//  JJControl
//
//  Created by admin on 2018/3/11.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "JJServiceInterface.h"
#import "MQTTClient.h"
#import "MQTTSessionManager.h"
static JJServiceInterface * _singleton;
@interface JJServiceInterface()<MQTTSessionManagerDelegate>{
    
}
@property (strong, nonatomic) MQTTSessionManager *manager;
@property (strong, nonatomic) NSDictionary *mqttSettings;
@property (strong, nonatomic) NSString *base;
@end

#define TARGET_OS_IPHONE 1
@implementation JJServiceInterface

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleton==nil) {
            _singleton = [[JJServiceInterface alloc] init];
        }
        
    });

    return _singleton;
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
       
        NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
        NSURL *mqttPlistUrl = [bundleURL URLByAppendingPathComponent:@"mqtt.plist"];
        self.mqttSettings = [NSDictionary dictionaryWithContentsOfURL:mqttPlistUrl];
        self.base = @"v1/cloud/request";
      //  self.manager.subscriptions = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:MQTTQosLevelExactlyOnce] forKey:self.base];
       // self.manager.subscriptions = [@{@"client_id": @(0)} mutableCopy];
        if (!self.manager) {
            self.manager = [[MQTTSessionManager alloc] init];
            self.manager.delegate = self;
           
        }
        
        
        
        
    }
   
    return self;
}

- (void)connectWithClientId:(NSString*)client_id{
    [self.manager connectTo:self.mqttSettings[@"host"]
                       port:[self.mqttSettings[@"port"] intValue]
                        tls:[self.mqttSettings[@"tls"] boolValue]
                  keepalive:3.0
                      clean:true
                       auth:false
                       user:nil
                       pass:nil
                  willTopic:@"v1/cloud/request"
                       will:nil
                    willQos:MQTTQosLevelExactlyOnce
             willRetainFlag:FALSE
               withClientId:client_id];
    
    [self.manager addObserver:self
                   forKeyPath:@"state"
                      options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                      context:nil];
    [self.manager addObserver:self
              forKeyPath:@"effectiveSubscriptions"
                 options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    switch (self.manager.state) {
        case MQTTSessionManagerStateClosed:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
    
                [_delegate showStatus:@"连接失败."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
        }
           
            
            break;
        case MQTTSessionManagerStateClosing:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                
                [_delegate showStatus:@"连接关闭."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
        }
            break;
        case MQTTSessionManagerStateConnected:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                
                [_delegate showStatus:@"连接成功."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectSuccess)]) {
                
                [_delegate connectSuccess];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
           
        }
            
          
            break;
        case MQTTSessionManagerStateConnecting:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                
                [_delegate showStatus:@"连接中."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
        }
            break;
        case MQTTSessionManagerStateError:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                
                [_delegate showStatus:@"连接错误."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
        }
            break;
        case MQTTSessionManagerStateStarting:
        default:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                
                [_delegate showStatus:@"连接关闭."];
                
            }
            if (_delegate && [_delegate respondsToSelector:@selector(connectFailue)]) {
                
                [_delegate connectFailue];
                
            }
            
        }
            break;
    }
    if ([keyPath isEqualToString:@"effectiveSubscriptions"]) {
        MQTTSessionManager *manager = (MQTTSessionManager *)object;
        NSLog(@"aa-%@",manager.effectiveSubscriptions);
       // DDLogVerbose(@"effectiveSubscriptions changed: %@", manager.effectiveSubscriptions);
    }
    
}

- (void)sendMsg:(NSData*)data toTopic:(NSString*)topic receiveTopic:(NSString*)recieve{
    
    self.manager.subscriptions = [@{topic: @(0),recieve: @(1)} mutableCopy];
    [self.manager sendData:data
                     topic:topic
                       qos:MQTTQosLevelAtLeastOnce
                    retain:FALSE];
    
    
}
- (void)handleMessage:(NSData *)data onTopic:(NSString *)topic retained:(BOOL)retained {
    /*
     * MQTTClient: process received message
     */
  
    if (data) {
    
        NSString *val = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if (val) {
        
            NSDictionary *dict =  [[self class]jsonDictWithString:val];
            if ([[dict objectForKey:@"code"]integerValue]!=0) {
                if (_delegate && [_delegate respondsToSelector:@selector(showStatus:)]) {
                    
                    [_delegate showStatus:[dict objectForKey:@"message"]];
                    
                }
            }else{
                if (_delegate && [_delegate respondsToSelector:@selector(receiveJson:)]) {
               
                    [_delegate receiveJson:dict];
               
                }
            }
           
        }
     
    }

    
   
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
