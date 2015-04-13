//
//  Stage2ViewController.h
//  game
//
//  Created by Kako on 2014/08/27.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Stage2ViewController : UIViewController{
    UIImageView *imgView;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *sumLabel;
    float time;
    int sum;
    NSTimer *timer;
    UIAlertView *alertView1;
    NSMutableArray *buttons;
    UIActionSheet *act;
    
    UIImageView *panda;
    UIImageView *compPanda;
    UIImageView *missPanda;
    UIImageView *timePanda;
    UIImage *imgArray1[10];
    UIImage *imgArray2[10];
    UIImage *imgArray3[10];
    IBOutlet UIImageView *ansImgView1;
    IBOutlet UIImageView *ansImgView2;
    IBOutlet UIImageView *ansImgView3;
    int ansGazou;
    int gazou1;
    int gazou2;
    int gazou3;
    
    AVAudioPlayer *bgmGam ;
    AVAudioPlayer *bgmBtn ;
    AVAudioPlayer *bgmReset;

}

-(IBAction)tapAct;
@end
