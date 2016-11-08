//
//  ViewController.h
//  MNMusicPlayer
//
//  Created by Student P_10 on 03/11/16.
//  Copyright © 2016 Mrunalini Nemade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    
    BOOL isPlaying;
    
    NSTimer *timer;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageviewArtWork;

@property (strong, nonatomic) IBOutlet UISlider *sliderDuration;

@property (strong, nonatomic) IBOutlet UIButton *buttonPlay;

- (IBAction)actionPlay:(id)sender;

- (IBAction)actionStop:(id)sender;

@end

