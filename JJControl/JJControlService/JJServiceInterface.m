//
//  JJServiceInterface.m
//  JJControl
//
//  Created by admin on 2018/3/11.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "JJServiceInterface.h"
#import "MQTTClient.h"
#import "MBProgressHUD.h"
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

-(instancetype)init {
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
           
            [self.manager connectTo:self.mqttSettings[@"host"]
                               port:[self.mqttSettings[@"port"] intValue]
                                tls:[self.mqttSettings[@"tls"] boolValue]
                          keepalive:30.0
                              clean:true
                               auth:false
                               user:nil
                               pass:nil
                          willTopic:@"v1/cloud/request"
                               will:nil
                            willQos:MQTTQosLevelExactlyOnce
                     willRetainFlag:FALSE
                       withClientId:@"18615277527"];//[[NSUserDefaults standardUserDefaults]valueForKey:@"UseTelephone"]*/
        } else {
             [self.manager connectToLast];
        }
        UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
        [MBProgressHUD showHUDAddedTo:window animated:YES];
        [self.manager addObserver:self
                       forKeyPath:@"state"
                          options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                          context:nil];
        
        
    }
   
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    switch (self.manager.state) {
        case MQTTSessionManagerStateClosed:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接失败."];
        }
           
            
            break;
        case MQTTSessionManagerStateClosing:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接关闭."];
        }
            break;
        case MQTTSessionManagerStateConnected:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接成功."];
            [MBProgressHUD hideHUDForView:window animated:YES];
           
        }
            
          
            break;
        case MQTTSessionManagerStateConnecting:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接中。。。"];
        }
            break;
        case MQTTSessionManagerStateError:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接错误."];
        }
            break;
        case MQTTSessionManagerStateStarting:
        default:
        {
            UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
            MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
            [hud.label setText:@"连接关闭."];
        }
            break;
    }
    
}

-(void)createscriptions:(NSString*)tel{
   //  NSString *response=[NSString stringWithFormat:@"v1/cloud/%@/response",tel];
     //self.manager.subscriptions = [@{@"v1/cloud/request": @(0),response: @(1)} mutableCopy];
}

-(void)sendMsg:(NSData*)data toTopic:(NSString*)topic receiveTopic:(NSString*)recieve{
    UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
    MBProgressHUD *hud = [MBProgressHUD HUDForView:window];
    [hud.label setText:@"发送中。。。"];
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
            
            if (_delegate && [_delegate respondsToSelector:@selector(receiveJson:)]) {
                UIWindow *window=[[[UIApplication sharedApplication]delegate]window];
                [MBProgressHUD hideHUDForView:window animated:YES];
                [_delegate receiveJson:dict];
               
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
