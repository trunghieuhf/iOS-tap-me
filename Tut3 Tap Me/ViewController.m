//
//  ViewController.m
//  Tut3 Tap Me
//
//  Created by Tran Trung Hieu on 3/10/14.
//  Copyright (c) 2014 Tran Trung Hieu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    self.scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    self.timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setupGame];
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
//    NSLog(@"Pressed!");
    count++;
    
    [buttonBeep play];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score\n%i", count];
}

- (void)setupGame
{
    seconds = 5;
    count = 0;
    
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score\n%i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}

- (void)subtractTime
{
    seconds--;
    self.timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    if (seconds == 0) {
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time over!" message:[NSString stringWithFormat:@"Your scored %i clicks", count] delegate:self cancelButtonTitle:@"Play again!" otherButtonTitles:nil];

        [backgroundMusic stop];
        [alert show];
    } else {
        [secondBeep setVolume:2];
        [secondBeep play];
        
//        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self setupGame];
        [backgroundMusic setVolume:0.3];
        [backgroundMusic play];
    }
}
// Play music
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if (!audioPlayer) {
        NSLog(@"%@", [error description]);
    }
    
    return audioPlayer;
}


@end
