//
//  ViewController.m
//  JJControl
//
//  Created by admin on 2018/3/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "JJServiceInterface.h"
#import "BDUMD5Crypt.h"
#import<CommonCrypto/CommonDigest.h>


#define KEY_MAC     @"HmacMD5"
#define encryptKey  @"gaoyusong"

@interface ViewController ()<JJServiceDelegate>

@end

@implementation ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView_  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-200)];
    [scrollView_ setShowsVerticalScrollIndicator:NO];
    [scrollView_ setShowsHorizontalScrollIndicator:NO];
    // scrollView_.canCancelContentTouches = YES;
    // scrollView_.delaysContentTouches = NO;
    // [scrollView_ setBounces:YES];
    [scrollView_ setBackgroundColor:[UIColor greenColor]];
    [scrollView_ setMaximumZoomScale:2.0];
    [scrollView_ setMinimumZoomScale:0.5];
    
    [scrollView_ setContentSize:CGSizeMake(self.view.frame.size.width,1000)];
    
    [self.view addSubview:scrollView_];
    
 //   [scrollView_ setDelegate:self];
    [scrollView_ setAccessibilityLabel:@"List"];
    [scrollView_ setAccessibilityIdentifier:@"List Value"];
    
    [scrollView_ setIsAccessibilityElement:YES];
    
    JJServiceInterface *service = [JJServiceInterface share];
    service.delegate = self;
    
    
   
}

-(void)createTopicFinished{
    JJServiceInterface *service = [JJServiceInterface share];
 //   NSString *pwd = @"123456";
    
    NSString *result =[BDUMD5Crypt HMACMD5WithString:encryptKey WithKey:KEY_MAC] ;
    
    NSString *str=[NSString stringWithFormat:@"{\"cmd\": 1002,\"user\": \"13911112222\",\"password\": %@,\"smscode\": 1234}" , result];
    
    [service sendMsg:[str dataUsingEncoding:NSUTF8StringEncoding] toTopic:@"v1/cloud/request"];
}

-(void)receiveJson:(NSDictionary*)dict
{
    NSLog(@"%@",dict);
    
}
-(void)connectFinished{
    
}
-(void)disconnect{
    
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
