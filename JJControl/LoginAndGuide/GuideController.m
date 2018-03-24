//
//  GuideController.m
//  JJControl
//
//  Created by admin on 2018/3/12.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "GuideController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "ViewController.h"
#import "LoginController.h"
@interface GuideController (){
    UIButton *startBtn_;
}
@property (nonatomic,strong) AVPlayer *player;//视频播放
@property (nonatomic,strong) AVPlayerLayer *playerLayer;
@end

@implementation GuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* _moviePath=[[NSBundle mainBundle]pathForResource:@"intro" ofType:@"mp4"];
   
    NSURL * videoURL = [NSURL fileURLWithPath:_moviePath];
    
    AVAsset *movieAsset    = [AVURLAsset URLAssetWithURL:videoURL options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    _player = [AVPlayer playerWithPlayerItem:playerItem];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = self.view.bounds;
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    _playerLayer.backgroundColor  = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:_playerLayer];
    [_player play];
    [self addNotification];
 
    //开启按钮
    startBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn_.frame = CGRectMake(30,self.view.frame.size.height-90,self.view.frame.size.width-60,45);
    [startBtn_ setBackgroundColor:[UIColor clearColor]];
    [startBtn_ addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn_ setTitle:@"开启智能之旅" forState:UIControlStateNormal];
    [startBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startBtn_ setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [startBtn_.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [startBtn_.layer setBorderColor:[UIColor whiteColor].CGColor];
    [startBtn_.layer setBorderWidth:1];
    [startBtn_.layer setCornerRadius:4];
    [startBtn_.layer setMasksToBounds:YES];
    [self.view addSubview:startBtn_];
}

- (void)startAction:(id)sender{
    
    LoginController *viewctrl = [[LoginController alloc]init];
    [self.navigationController pushViewController:viewctrl animated:NO];
}


- (void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

- (void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  播放完成通知
 *
 *  @param notification 通知对象
 */
- (void)playbackFinished:(NSNotification *)notification{
    
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_playerLayer removeFromSuperlayer];
    [_player pause];
    [self removeNotification];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
