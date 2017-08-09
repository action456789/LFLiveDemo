//
//  PullViewController.m
//  LFLiveDemo
//
//  Created by sen.ke on 2017/8/9.
//  Copyright © 2017年 sen.ke. All rights reserved.
//  拉流

#import "PullViewController.h"
#import <IJKMediaPlayer/IJKMediaPlayer.h>

@interface PullViewController ()

@end

@implementation PullViewController {
    IJKFFMoviePlayerController *_playerVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)startPlay {
    NSURL *url = [NSURL URLWithString:@"rtmp://192.168.0.50:1935/rtmplive/room"];
    _playerVC = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    [_playerVC prepareToPlay];
    
    _playerVC.view.frame = self.view.bounds;
    [self.view addSubview:_playerVC.view];
}

- (void)stopPlay {
    [_playerVC pause];
    [_playerVC stop];
}

@end
