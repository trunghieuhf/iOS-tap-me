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
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
//    NSLog(@"Pressed!");
    count++;
    
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

        
        [alert show];
    } else {
        
        
//        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self setupGame];
    }
}
@end
