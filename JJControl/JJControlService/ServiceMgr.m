//
//  ServiceMgr.m
//  JJControl
//
//  Created by admin on 2018/3/26.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ServiceMgr.h"
#import "JJServiceInterface.h"

static ServiceMgr * _singleton;

@interface ServiceMgr()<JJServiceDelegate>{
    ReceiveBlock receiveBlock_;
}
@end
@implementation ServiceMgr

+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleton==nil) {
            _singleton = [[ServiceMgr alloc] init];
        }
        
    });
    
    return _singleton;
    
}
-(instancetype)init{
    self = [super init];
    if (self) {
        JJServiceInterface *service = [JJServiceInterface share];
        service.delegate = self;
        
    }
    return self;
}

-(void)sendMessage:(NSDictionary*)dict withTopic:(NSString*)topic withResponse:(NSString*)receiveTopic withSuccess:(ReceiveBlock)block{
    if (dict) {
        JJServiceInterface *service = [JJServiceInterface share];
        receiveBlock_ = [block copy];
        NSString *str =  [[JJServiceInterface class] jsonStringWithDictionary:dict];
        [service sendMsg:[str dataUsingEncoding:NSUTF8StringEncoding] toTopic:topic receiveTopic:receiveTopic];
    }
    
}

- (void)receiveJson:(NSDictionary*)dict
{
    if (dict) {
        if (receiveBlock_) {
            receiveBlock_(dict);
        }
    }
    
}
@end
