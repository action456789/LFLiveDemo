//
//  ViewController.m
//  LFLiveDemo
//
//  Created by sen.ke on 2017/8/8.
//  Copyright © 2017年 sen.ke. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "PullViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *pushView;
@property (weak, nonatomic) IBOutlet UIView *pullView;

@end

@implementation ViewController {
    PushViewController *_push;
    PullViewController *_pull;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _push = [[PushViewController alloc] init];
    _push.view.frame = self.pushView.bounds;
    [self.pushView addSubview:_push.view];
    
    _pull = [[PullViewController alloc] init];
    _pull.view.frame = self.pullView.bounds;
    [self.pullView addSubview:_pull.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startAction:(id)sender {
    [_push startLive];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_pull startPlay];
    });
}

- (IBAction)stopAction:(id)sender {
    [_push stopLive];
    [_pull stopPlay];
}

- (IBAction)switchCamare:(id)sender {
    [_push switchCamare];
}
@end
