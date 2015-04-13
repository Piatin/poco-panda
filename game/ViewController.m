//
//  ViewController.m
//  game
//
//  Created by Kako on 2014/08/06.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    // adView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:adView];
    //[ImobileSdkAds showBySpotID:@"314073" View:adView];
    
    
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i < 11; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"pan%02d.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageList addObject:img];
    }
    
    // アニメーション用画像をセット
    imageView.animationImages = imageList;
    
    // アニメーションの速度
    imageView.animationDuration = 1.8;
    
    // アニメーションのリピート回数
    imageView.animationRepeatCount = 0;
    
    [imageView startAnimating];
    
    //BGM
    NSString *path = [[NSBundle mainBundle] pathForResource:@"opening" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [bgm setNumberOfLoops:-1];
    [bgm play] ;

    ai.hidden =YES;

}

- (IBAction)start{
    ai.hidden =NO;
    [ai startAnimating];
    [self performSegueWithIdentifier:@"topToStage1Segue" sender:nil ];
     NSLog(@"止めたよ");
    
}

-(IBAction)gallery{
    [self performSegueWithIdentifier:@"topToGallerySegue" sender:nil];
    NSLog(@"止めたよ２");
}

-(IBAction)rule{
    [self performSegueWithIdentifier:@"topToExpSegue" sender:nil];
    NSLog(@"止めたよ２");
}

-(void)viewDidDisappear:(BOOL)animated{
    [bgm stop];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
