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
     
    
   
}

- (void)createTopicFinished{
    
  
}

- (void)receiveJson:(NSDictionary*)dict
{
    NSLog(@"%@",dict);
    
}
- (void)connectFinished{
    
}
- (void)disconnect{
    
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
