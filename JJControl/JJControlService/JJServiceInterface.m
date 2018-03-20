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
@property (weak, nonatomic)   UILabel *status;
@property (strong, nonatomic) NSString *base;
@end

#define TARGET_OS_IPHONE 1
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
    CGRect bounds=[UIScreen mainScreen].bounds;
    return  [[self alloc] initWithFrame:bounds];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *tmpview=[[UILabel alloc]initWithFrame:frame];
        UIWindow *window =[[UIApplication sharedApplication].delegate window];
        [window addSubview:tmpview];
        [tmpview setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.6]];
        [tmpview setTextColor:[UIColor whiteColor]];
        [tmpview setTextAlignment:NSTextAlignmentCenter];
        self.status = tmpview;

        NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
        NSURL *mqttPlistUrl = [bundleURL URLByAppendingPathComponent:@"mqtt.plist"];
        self.mqttSettings = [NSDictionary dictionaryWithContentsOfURL:mqttPlistUrl];
        self.base = @"v1.cloud.request";
        self.manager.subscriptions = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:MQTTQosLevelExactlyOnce]
                                                                 forKey:[NSString stringWithFormat:@"%@/#", self.base]];
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
                          willTopic:@"v1.cloud.request"
                               will:nil
                            willQos:MQTTQosLevelExactlyOnce
                     willRetainFlag:FALSE
                       withClientId:nil];//[[NSUserDefaults standardUserDefaults]valueForKey:@"UseTelephone"]*/
        } else {
             [self.manager connectToLast];
        }
        
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
            self.status.text = @"closed";
            break;
        case MQTTSessionManagerStateClosing:
            self.status.text = @"closing";
            break;
        case MQTTSessionManagerStateConnected:
            self.status.text = [NSString stringWithFormat:@"connected as %@-%@",
                                [UIDevice currentDevice].name,
                                @"登陆"];
            self.manager.subscriptions = [@{@"v1/cloud/13979902123/request": @(0),@"client_id": @(1),@"v1/cloud/13979902123/response": @(2)} mutableCopy];
          /*  [self.manager sendData:[@"13979902123" dataUsingEncoding:NSUTF8StringEncoding]
                             topic:@"v1/cloud/13979902123/request"
                               qos:MQTTQosLevelAtLeastOnce
                            retain:FALSE];*/
            
            break;
        case MQTTSessionManagerStateConnecting:
            self.status.text = @"connecting";
            break;
        case MQTTSessionManagerStateError:
            self.status.text = @"error";
            break;
        case MQTTSessionManagerStateStarting:
        default:
            self.status.text = @"not connected";
            break;
    }

}

-(void)removeAction{
    [self removeFromSuperview];
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


-(void)sendMsg:(NSData*)data toTopic:(NSString*)topic{
 
    [self.manager sendData:data
                     topic:topic
                       qos:MQTTQosLevelAtLeastOnce
                    retain:FALSE];
    
    
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
- (void)handleMessage:(NSData *)data onTopic:(NSString *)topic retained:(BOOL)retained {
    /*
     * MQTTClient: process received message
     */
    
    if (data) {
    
        NSString *val = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if (val) {
        
            NSDictionary *dict =  [[self class]jsonDictWithString:val];
            
            if (_delegate && [_delegate respondsToSelector:@selector(receiveJson:)]) {
            
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
