//
//  ViewController.h
//  game
//
//  Created by Kako on 2014/08/06.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController

{
    IBOutlet UIImageView *imageView;
    AVAudioPlayer *bgm ;
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *galleryBtn;
    IBOutlet UIButton *ruleBtn;

    IBOutlet UIActivityIndicatorView *ai;
}

-(IBAction)start;
-(IBAction)gallery;
-(IBAction)rule;
@end

