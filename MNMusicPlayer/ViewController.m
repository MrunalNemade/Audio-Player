//
//  ViewController.m
//  MNMusicPlayer
//
//  Created by Student P_10 on 03/11/16.
//  Copyright © 2016 Mrunalini Nemade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isPlaying = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)initializedAudioPlayer {
    
    BOOL status = false;
    
    NSURL *musicURL = [[NSBundle mainBundle]URLForResource:@"mySong" withExtension:@"mp3"];
    
    if (musicURL != nil) {
        NSError *error;
        
        audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:&error];
        
        if (error != nil) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            status = true;
        }
    }
    return status;
}

- (IBAction)actionPlay:(id)sender {
    
    UIButton *button = sender;
    
    if ([button.titleLabel.text isEqualToString:@"Play"]) {
        if (isPlaying) {
            [audioPlayer play];
        }
        else {
            if ([self initializedAudioPlayer]) {
                [audioPlayer play];
                isPlaying = true;
            }
            else {
                NSLog(@"Something went wrong while initializing audio player");
            }
        }
        
        [button setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if ([button.titleLabel.text isEqualToString:@"Pause"]) {
        
        [audioPlayer pause];
        [button setTitle:@"Play" forState:UIControlStateNormal];
    }
}

- (IBAction)actionStop:(id)sender {
    
    [audioPlayer stop];
    isPlaying = false;
    
    [self.buttonPlay setTitle:@"Play" forState:UIControlStateNormal ];
}
@end
