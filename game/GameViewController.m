//
//  GameViewController.m
//  game
//
//  Created by Kako on 2014/08/06.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "GameViewController.h"
#import "stage1anime.h"


@interface GameViewController ()<UIActionSheetDelegate>

@end


static int H_BUTTON_LENGTH = 6; // ボタンの数（横）
static int V_BUTTON_LENGTH = 9; // ボタンの数（縦）

@implementation GameViewController{
    int active;
    
    

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //パンダ
    
    SKView *skView =(SKView *)self.view;
    SKScene *scene = [stage1anime sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    //SKViewに作ったシーンを表示
    [skView presentScene:scene];
    

    
    // ボタンをのっける画像のimageView
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // iPhone
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960){
                // iPhone4 or 4S
                NSLog(@"iphone 4, 4s imgview");
                imgView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 75, 247, 297)];
               
                
            }
            if(result.height == 1136){
                // iPhone5
                NSLog(@"iphone 5 imgview");
                imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 360)];
                

            }
        }
        
    }
    
 
    
    //回答の画像１
    imgArray1[0] = [UIImage imageNamed:@"ca0.png"];
    imgArray1[1] = [UIImage imageNamed:@"ca1.png"];
    imgArray1[2] = [UIImage imageNamed:@"ca2.png"];
    imgArray1[3] = [UIImage imageNamed:@"ca3.png"];
    imgArray1[4] = [UIImage imageNamed:@"ca4.png"];
    imgArray1[5] = [UIImage imageNamed:@"ca5.png"];
    imgArray1[6] = [UIImage imageNamed:@"ca6.png"];
    imgArray1[7] = [UIImage imageNamed:@"ca7.png"];
    imgArray1[8] = [UIImage imageNamed:@"ca8.png"];
    imgArray1[9] = [UIImage imageNamed:@"ca9.png"];
    
    gazou1 = arc4random_uniform(10);
    NSLog(@"画像１は%d",gazou1);
    [ansImgView1 setImage:imgArray1[gazou1]];
    
    NSString *imagePath = [NSString stringWithFormat:@"ca%d.png", gazou1];
    ansImgView1.image = [UIImage imageNamed:imagePath];
    [self.view addSubview:ansImgView1];

    //回答の画像２
    imgArray2[0] = [UIImage imageNamed:@"ca0.png"];
    imgArray2[1] = [UIImage imageNamed:@"ca1.png"];
    imgArray2[2] = [UIImage imageNamed:@"ca2.png"];
    imgArray2[3] = [UIImage imageNamed:@"ca3.png"];
    imgArray2[4] = [UIImage imageNamed:@"ca4.png"];
    imgArray2[5] = [UIImage imageNamed:@"ca5.png"];
    imgArray2[6] = [UIImage imageNamed:@"ca6.png"];
    imgArray2[7] = [UIImage imageNamed:@"ca7.png"];
    imgArray2[8] = [UIImage imageNamed:@"ca8.png"];
    imgArray2[9] = [UIImage imageNamed:@"ca9.png"];
    
    
    gazou2 = arc4random_uniform(10);
    
    while (gazou2 == gazou1) {
        
        gazou2 = arc4random_uniform(10);

        if(gazou1 != gazou2){
            break;
        }
    }
    
    NSLog(@"画像２は%d",gazou2);
    
    [ansImgView2 setImage:imgArray2[gazou2]];

    
    NSString *imagePath2 = [NSString stringWithFormat:@"ca%d.png", gazou2];
    ansImgView2.image = [UIImage imageNamed:imagePath2];
    [self.view addSubview:ansImgView2];

    
    //回答の画像３
    imgArray3[0] = [UIImage imageNamed:@"ca0.png"];
    imgArray3[1] = [UIImage imageNamed:@"ca1.png"];
    imgArray3[2] = [UIImage imageNamed:@"ca2.png"];
    imgArray3[3] = [UIImage imageNamed:@"ca3.png"];
    imgArray3[4] = [UIImage imageNamed:@"ca4.png"];
    imgArray3[5] = [UIImage imageNamed:@"ca5.png"];
    imgArray3[6] = [UIImage imageNamed:@"ca6.png"];
    imgArray3[7] = [UIImage imageNamed:@"ca7.png"];
    imgArray3[8] = [UIImage imageNamed:@"ca8.png"];
    imgArray3[9] = [UIImage imageNamed:@"ca9.png"];
    
    gazou3 = arc4random_uniform(10);
    
    while (gazou3 == gazou1 || gazou3 == gazou2) {
        
        gazou3 = arc4random_uniform(10);
        
        if(gazou3 != gazou1 && gazou3 != gazou2){
            break;
        }
    }
    
    [ansImgView3 setImage:imgArray3[gazou3]];
    
    
    NSString *imagePath3 = [NSString stringWithFormat:@"ca%d.png", gazou3];
    ansImgView3.image = [UIImage imageNamed:imagePath3];
    [self.view addSubview:ansImgView3];
    
    
    NSLog(@"画像３は%d",gazou3);
    
    skView.layer.zPosition = 1;
    imgView.layer.zPosition = 2;
    
    //答えの画像
    ansGazou = arc4random_uniform(3);
    NSLog(@"%d番目",ansGazou);
    
    if (ansGazou ==0) {
        imgView.image = [UIImage imageNamed:imagePath];
    }else if(ansGazou ==1){
        imgView.image = [UIImage imageNamed:imagePath2];
    }else{
        imgView.image = [UIImage imageNamed:imagePath3];
    }
    
    
    imgView.userInteractionEnabled = YES; // imageViewのタッチイベントを可能にする
    
    [self.view addSubview:imgView];
    
    // ボタンの作成
    buttons =[NSMutableArray new];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // iPhone
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960){
                // iPhone4 or 4S
                NSLog(@"iphone 4, 4s button");
                for (int y=0; y < V_BUTTON_LENGTH; y++) {
                    for (int x=0; x < H_BUTTON_LENGTH; x++) {
                        
                        float width = 250 / H_BUTTON_LENGTH;   // ボタンの幅
                        float height = 300 / V_BUTTON_LENGTH;  // ボタンの高さ
                        
                        
                        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(width*x, height*y, width, height)];
                        UIImage *btimg = [UIImage imageNamed:@"button1.jpg"];
                        
                        [button setBackgroundImage:btimg forState:UIControlStateNormal];
                        // ボタンを押した時の処理を設定
                        [button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        [buttons addObject:button];
                        [imgView addSubview:button];
                        
                        button.tag = y * H_BUTTON_LENGTH + x;
                        
                        
                    }
                }

                           }
            if(result.height == 1136){
                // iPhone5
                NSLog(@"iphone 5 button");
                for (int y=0; y < V_BUTTON_LENGTH; y++) {
                    for (int x=0; x < H_BUTTON_LENGTH; x++) {
                        
                        float width = 300 / H_BUTTON_LENGTH;   // ボタンの幅
                        float height = 360 / V_BUTTON_LENGTH;  // ボタンの高さ
                        
                        
                        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(width*x, height*y, width, height)];
                        UIImage *btimg = [UIImage imageNamed:@"button1.jpg"];
                        
                        [button setBackgroundImage:btimg forState:UIControlStateNormal];
                        // ボタンを押した時の処理を設定
                        [button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        [buttons addObject:button];
                        [imgView addSubview:button];
                        
                        button.tag = y * H_BUTTON_LENGTH + x;
                        
                    }
                }

                
            }
        }
        
    }

    
    //赤いボタン
    active = arc4random_uniform((V_BUTTON_LENGTH-1) * (H_BUTTON_LENGTH) - 1);
    
    for(UIButton *button in buttons){
        if(button.tag == active){

            UIImage *btimg2 = [UIImage imageNamed:@"button2.jpg"];
            
            [button setBackgroundImage:btimg2 forState:UIControlStateNormal];
           
            
        }
    }
    
    
    
    [self.view bringSubviewToFront:skView];
    [self.view sendSubviewToBack:imgView];
    
    NSLog(@"This method was called.");
    
    //スワイプ
    
    [ansImgView1 setUserInteractionEnabled:YES];
    [ansImgView2 setUserInteractionEnabled:YES];
    [ansImgView3 setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeUp1 = [[UISwipeGestureRecognizer alloc]
                                          initWithTarget:self
                                                  action:@selector( handleSwipeUpGesture1:)];
    
    UISwipeGestureRecognizer *swipeUp2 = [[UISwipeGestureRecognizer alloc]
                                          initWithTarget:self
                                                  action:@selector( handleSwipeUpGesture2:)];
    
    UISwipeGestureRecognizer *swipeUp3 = [[UISwipeGestureRecognizer alloc]
                                          initWithTarget:self
                                                  action:@selector( handleSwipeUpGesture3:)];
    
    // Setting the swipe direction.
    [swipeUp1 setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeUp2 setDirection:UISwipeGestureRecognizerDirectionUp];
    [swipeUp3 setDirection:UISwipeGestureRecognizerDirectionUp];
    
    // Adding the swipe gesture on image view
    [ansImgView1 addGestureRecognizer:swipeUp1];
    [ansImgView2 addGestureRecognizer:swipeUp2];
    [ansImgView3 addGestureRecognizer:swipeUp3];
    
    
    //点数
    sum =00000;
    sumLabel.text=[NSString stringWithFormat:@"%d",sum];
    
    //タイマー
    time = 35.0;
    timeLabel.text =[NSString stringWithFormat:@"%.2f", time];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(down)
                                           userInfo:nil
                                            repeats:YES
             ];

    
   
}



// ボタンを押された時の処理
- (void)tapped:(UIButton *)button
{
    if(button.tag==active){
        button.alpha = 0.0; // ボタンを透明にする。

       //ボタン音
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"botan" ofType:@"mp3"] ;
        NSURL *url2 = [NSURL fileURLWithPath:path2];
        bgmBtn = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:nil];
        [bgmBtn setNumberOfLoops:1];
        [bgmBtn play] ;

        
        button.tag =-1; //タグ変更
        
        UIButton *nextButton = buttons[arc4random()%buttons.count]; //ランダムに１個選ぶ
        NSLog(@"%dタグ",active);
        while(nextButton.tag == -1){
            
            nextButton = buttons[arc4random()%buttons.count];
            NSLog(@"ランダム");
            
        }
        
        active = nextButton.tag;
        
        NSLog(@"%dタグ２",active);
        
        for(UIButton *button in buttons){
            
            if(button.tag==active){
                UIImage *btimg2 = [UIImage imageNamed:@"button2.jpg"];
                
                [button setBackgroundImage:btimg2 forState:UIControlStateNormal];
                
                NSLog(@"赤");
            }
        }

        
        //点数
        sum =sum+100;
        sumLabel.text=[NSString stringWithFormat:@"%d",sum];
        
    }else{
        
        sum =sum-200;
        sumLabel.text=[NSString stringWithFormat:@"%d",sum];
        
        for(UIButton *button in buttons){

        button.alpha =1.0;
            UIImage *btimg = [UIImage imageNamed:@"button1.jpg"];
            
            [button setBackgroundImage:btimg forState:UIControlStateNormal];
                    }
        NSLog(@"リセット");
        
        //ボタン音
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"reset" ofType:@"mp3"] ;
        NSURL *url3 = [NSURL fileURLWithPath:path3];
        bgmReset = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:nil];
        [bgmReset setNumberOfLoops:1];
        [bgmReset play] ;
        
        UIButton *nextButton = buttons[arc4random()%buttons.count]; //ランダムに１個選ぶ
        while(nextButton.tag == -1){
            
            nextButton = buttons[arc4random()%buttons.count];
            NSLog(@"ランダム");
            
        }
        NSLog(@"%dタグ",active);
        active = nextButton.tag;
        
        for(UIButton *button in buttons){
            
            if(button.tag==active){
                UIImage *btimg2 = [UIImage imageNamed:@"button2.jpg"];
                
                [button setBackgroundImage:btimg2 forState:UIControlStateNormal];
                
                NSLog(@"赤");
            }        }
        }
    
}






-(void)down{
    time -=0.01 ;
    timeLabel.text = [NSString stringWithFormat:@"%.2f",time];
    
    
    if(time <= 0){
        
        [timer invalidate];
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }

        
        //タイムアップ
        //[panda stopAnimating];
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"timeUp.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        //アニメーション実行

        [UIView commitAnimations];
        
        //panda
        timePanda = [[UIImageView alloc] initWithFrame:CGRectMake(-80, 90, 450, 450)];
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 3; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"time%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:timePanda];
        // アニメーション用画像をセット
        timePanda.animationImages = imageList;
        
        // アニメーションの速度
        timePanda.animationDuration = 0.3;
        
        // アニメーションのリピート回数
        timePanda.animationRepeatCount = 0;
        
        [timePanda startAnimating];
        
        
        [self.view bringSubviewToFront:timePanda];

        
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1ToTopSegue" sender:self];
        [bgmGam stop];
        

        
    }
}


//スワイプ
- (void) handleSwipeUpGesture1:(UISwipeGestureRecognizer *)sender {
    NSLog(@"１番目がスワイプされた");
    [timer invalidate];
    if(ansGazou ==0 && time>=0){
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [ud setInteger:sum forKey:@"index"];
        
        [ud synchronize];
        
        NSUserDefaults *ti = [NSUserDefaults standardUserDefaults];
        
        [ti setInteger:time forKey:@"time1"];
        
        [ti synchronize];
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }
        
        //クリア！
        //[panda stopAnimating];
        
        
        UIImageView *animationView;
        
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"clearstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
        
        //panda
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-47, 100, 400, 400)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-80, 120, 450, 450)];
                }
            }
            
        }
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 5; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"clear%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:clearPanda];
        // アニメーション用画像をセット
        clearPanda.animationImages = imageList;
        
        
        // アニメーションの速度
        clearPanda.animationDuration = 0.7;
        
        // アニメーションのリピート回数
        clearPanda.animationRepeatCount = 0;
        
        [clearPanda startAnimating];
        [self.view bringSubviewToFront:clearPanda];

        
        //timeWait
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1To2Segue" sender:self];
        [bgmGam stop];


    }else{
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }
        
        //[panda stopAnimating];
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"missstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
        
        //panda
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-45, 90, 400, 505)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-50, 120, 400, 505)];
                }
            }
            
        }
        
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 8; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"miss%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:missPanda];
        // アニメーション用画像をセット
        missPanda.animationImages = imageList;
        
        // アニメーションの速度
        missPanda.animationDuration = 1.4;
        
        // アニメーションのリピート回数
        missPanda.animationRepeatCount = 0;
        
        [missPanda startAnimating];
        
        
        [self.view bringSubviewToFront:missPanda];

        
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1ToTopSegue" sender:self];
        [bgmGam stop];


    }
}

- (void) handleSwipeUpGesture2:(UISwipeGestureRecognizer *)sender {
    NSLog(@"2番目がスワイプされた");
    [timer invalidate];
    
    if(ansGazou ==1 && time>=0){
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [ud setInteger:sum forKey:@"index"];
        
        [ud synchronize];
        
        NSUserDefaults *ti = [NSUserDefaults standardUserDefaults];
        
        [ti setInteger:time forKey:@"time1"];
        
        [ti synchronize];
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }

        
        //クリア！
        
        //[panda stopAnimating];
        
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"clearstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
        
        //panda
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-47, 100, 400, 400)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-80, 120, 450, 450)];
                }
            }
            
        }
        
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 5; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"clear%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:clearPanda];
        // アニメーション用画像をセット
        clearPanda.animationImages = imageList;
        
        // アニメーションの速度
        clearPanda.animationDuration = 0.7;
        
        // アニメーションのリピート回数
        clearPanda.animationRepeatCount = 0;
        
        [clearPanda startAnimating];
        [self.view bringSubviewToFront:clearPanda];

        
        //timeWait
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1To2Segue" sender:self];
        [bgmGam stop];
        
        
    }else{
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }
        
        //[panda stopAnimating];
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"missstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
       
        //panda
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-45, 90, 400, 505)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-50, 120, 400, 505)];
                }
            }
            
        }
        

        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 8; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"miss%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:missPanda];
        // アニメーション用画像をセット
        missPanda.animationImages = imageList;
        
        // アニメーションの速度
        missPanda.animationDuration = 1.4;
        
        // アニメーションのリピート回数
        missPanda.animationRepeatCount = 0;
        
        [missPanda startAnimating];
        
        
        [self.view bringSubviewToFront:missPanda];
        

        
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1ToTopSegue" sender:self];
        [bgmGam stop];
        
        
    }

}

- (void) handleSwipeUpGesture3:(UISwipeGestureRecognizer *)sender {
    NSLog(@"3番目がスワイプされた");
    [timer invalidate];
    
    if(ansGazou ==2 && time>=0){
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [ud setInteger:sum forKey:@"index"];
        
        [ud synchronize];
        
        NSUserDefaults *ti = [NSUserDefaults standardUserDefaults];
        
        [ti setInteger:time forKey:@"time1"];
        
        [ti synchronize];
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }

        
        //クリア！
        //[panda stopAnimating];
        
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"clearstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
        
        //panda
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-47, 100, 400, 400)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    clearPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-80, 120, 450, 450)];
                }
            }
            
        }
        
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 5; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"clear%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:clearPanda];
        // アニメーション用画像をセット
        clearPanda.animationImages = imageList;
        
        // アニメーションの速度
        clearPanda.animationDuration = 0.7;
        
        // アニメーションのリピート回数
        clearPanda.animationRepeatCount = 0;
        
        [clearPanda startAnimating];
        
        
        [self.view bringSubviewToFront:clearPanda];
        
        
        //timeWait
        
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1To2Segue" sender:self];
        [bgmGam stop];
        
        
    }else{
        
        for(UIButton *button in buttons){
            
            button.alpha = 0.0;
        }
        
        //[panda stopAnimating];
        
        UIImageView *animationView;
        
        animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 320, 568)];
        animationView.image = [UIImage imageNamed:@"missstage.png"];
        [self.view addSubview:animationView];
        
        [UIView beginAnimations:nil context:NULL];
        //アニメーション秒数
        [UIView setAnimationDuration:0.5f];
        //デリゲート指定
        [UIView setAnimationDelegate:self];
        //アニメーションの目標値を指定
        [animationView setFrame:CGRectMake(0, 0, 320, 568)];
        
        [UIView commitAnimations];
        
        
        //panda
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-45, 90, 400, 505)];
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    
                    missPanda = [[UIImageView alloc] initWithFrame:CGRectMake(-50, 120, 400, 505)];
                }
            }
            
        }
        

        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 8; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"miss%02d.png", i];
            UIImage *img = [UIImage imageNamed:imagePath];
            [imageList addObject:img];
        }
        
        [self.view addSubview:missPanda];
        // アニメーション用画像をセット
        missPanda.animationImages = imageList;
        
        // アニメーションの速度
        missPanda.animationDuration = 1.4;
        
        // アニメーションのリピート回数
        missPanda.animationRepeatCount = 0;
        
        [missPanda startAnimating];
        
        
        [self.view bringSubviewToFront:missPanda];
        
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
        
        
        [self performSegueWithIdentifier:@"stage1ToTopSegue" sender:self];
        [bgmGam stop];
        
        
    }

}


//アクションシート
-(IBAction)tapAct{
    
    act =[[UIActionSheet alloc]
          initWithTitle:@"break time"
          delegate:self
          cancelButtonTitle:nil
          destructiveButtonTitle:@"ゲームに戻る"
          otherButtonTitles:@"タイトルへ" ,nil];
    
    [act showInView:self.view];
    
    [timer invalidate];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch(buttonIndex){
    case 0: //cancel
            
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target:self
                                                   selector:@selector(down)
                                                   userInfo:nil
                                                    repeats:YES
                     ];

        break;
        
    case 1: //title
            
            [self performSegueWithIdentifier:@"stage1ToTopSegue" sender:self];
            [bgmGam stop];
        
        break;
            
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    //BGM
    NSString *path = [[NSBundle mainBundle] pathForResource:@"game-now" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path];
    bgmGam = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [bgmGam setNumberOfLoops:-1];
    [bgmGam play] ;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
