//
//  ResultViewController.m
//  game
//
//  Created by Kako on 2014/08/26.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "ResultViewController.h"
#import<Social/Social.h>


@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    int index = [ud integerForKey:@"index"];
    
    NSUserDefaults *ten = [NSUserDefaults standardUserDefaults];
    
    int index2 = [ten integerForKey:@"index2"];
    
    NSUserDefaults *ti = [NSUserDefaults standardUserDefaults];
    
    int time1 = [ti integerForKey:@"time1"];
    
    NSLog(@"%dタイム１",time1);
    
    NSUserDefaults *me = [NSUserDefaults standardUserDefaults];
    
    int time2 = [me integerForKey:@"time2"];
    
    NSLog(@"%dタイム２",time2);
    
    
    
    goukei = index + index2 + (time1 * 100) + (time2 * 150);
    
    NSLog(@"%d",goukei);
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"drumroll" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path];
    drumRoll = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [drumRoll setNumberOfLoops:-1];
    [drumRoll play] ;

    
   

    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [[NSRunLoop currentRunLoop]
     runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]
     ];
    
    resultLabel.text = [NSString stringWithFormat:@"%d",goukei];
    if(goukei >=5500){
        
        resultLabel.textColor = [UIColor blueColor];
    }
    
    [[NSRunLoop currentRunLoop]
     runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]
     ];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ending" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path];
    bgmEnd = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [bgmEnd setNumberOfLoops:-1];
    [bgmEnd play] ;
    
    [drumRoll stop];
    
    imgArray[0] = [UIImage imageNamed:@"ca0.png"];
    imgArray[1] = [UIImage imageNamed:@"ca1.png"];
    imgArray[2] = [UIImage imageNamed:@"ca2.png"];
    imgArray[3] = [UIImage imageNamed:@"ca3.png"];
    imgArray[4] = [UIImage imageNamed:@"ca4.png"];
    imgArray[5] = [UIImage imageNamed:@"ca5.png"];
    imgArray[6] = [UIImage imageNamed:@"ca6.png"];
    imgArray[7] = [UIImage imageNamed:@"ca7.png"];
    imgArray[8] = [UIImage imageNamed:@"ca8.png"];
    imgArray[9] = [UIImage imageNamed:@"ca9.png"];

    gazou1 = arc4random()%10;
    NSLog(@"画像１は%d",gazou1);
    [imgView setImage:imgArray[gazou1]];
    
    NSString *imagePath = [NSString stringWithFormat:@"ca%d.png", gazou1];
    imgView.image = [UIImage imageNamed:imagePath];
    [self.view addSubview:imgView];
    
    NSUserDefaults *card = [NSUserDefaults standardUserDefaults];
    
    [card setObject:imagePath forKey:imagePath];
    [card synchronize];
    
    
    if(goukei >=3000){
        
        gazou2 = arc4random()%10;
        NSLog(@"画像2は%d",gazou2);
        [imgView2 setImage:imgArray[gazou2]];
        
        NSString *imagePath = [NSString stringWithFormat:@"ca%d.png", gazou2];
        imgView2.image = [UIImage imageNamed:imagePath];
        [self.view addSubview:imgView2];
        
        NSUserDefaults *card2 = [NSUserDefaults standardUserDefaults];
        [card2 setObject:imagePath forKey:imagePath];
        [card2 synchronize];
        
        
    }
    
}
    
-(IBAction)taptw{
    
    
    SLComposeViewController *twitterVC =
    [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [twitterVC setInitialText:[NSString stringWithFormat:@"[PocoPanda]\nYou got %d score!!",goukei]];
    
    [self presentViewController:twitterVC animated:YES completion:nil];
    
}

-(IBAction)tapfb{
    
    
    SLComposeViewController *facebookVC =
    [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [facebookVC setInitialText:[NSString stringWithFormat:@"[PocoPanda]\nYou got %d score!!",goukei]];
    [self presentViewController:facebookVC animated:YES completion:nil];
    
}

-(IBAction)tapTop{
    
    [bgmEnd stop];
    [self performSegueWithIdentifier:@"resultToTopSegue" sender:nil];

}


-(IBAction)tapGal{
    
    [bgmEnd stop];
}

-(void)ViewDidDisappear{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
