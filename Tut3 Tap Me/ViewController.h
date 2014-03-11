//
//  ViewController.h
//  Tut3 Tap Me
//
//  Created by Tran Trung Hieu on 3/10/14.
//  Copyright (c) 2014 Tran Trung Hieu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *tapBtn;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property(nonatomic) NSInteger cancelButtonIndex;
- (IBAction)buttonPressed;
@end
