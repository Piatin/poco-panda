//
//  ResultViewController.h
//  game
//
//  Created by Kako on 2014/08/26.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ResultViewController : UIViewController{
    
    int goukei;
    IBOutlet UIButton *twitter;
    IBOutlet UIButton *facebook;
    IBOutlet UIButton *top;
    IBOutlet UIButton *gallery;
    IBOutlet UILabel *resultLabel ;  //結果
    
    
    UIImage *imgArray[10];
    int gazou1;
    int gazou2;
    IBOutlet UIImageView *imgView;
    IBOutlet UIImageView *imgView2;
    
       
    AVAudioPlayer *bgmEnd ;
    AVAudioPlayer *drumRoll;
}

-(IBAction)taptw;
-(IBAction)tapfb;
-(IBAction)tapTop;
-(IBAction)tapGal;

@end
