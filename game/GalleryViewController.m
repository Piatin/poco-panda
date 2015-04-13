//
//  GalleryViewController.m
//  game
//
//  Created by Kako on 2014/08/29.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "GalleryViewController.h"



@interface GalleryViewController ()

@end

@implementation GalleryViewController

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
    
    /* -- UserDefaults のリセット用 -- */
//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    NSInteger pageSize = 10; // ページ数
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // UIScrollViewのインスタンス化
    scrollView2 = [[UIScrollView alloc]init];
    scrollView2.frame = self.view.bounds;
    
    // 横スクロールのインジケータを非表示にする
    scrollView2.showsHorizontalScrollIndicator = NO;
    
    // ページングを有効にする
    scrollView2.pagingEnabled = YES;
    
    scrollView2.userInteractionEnabled = YES;
    scrollView2.delegate = self;
    
    // スクロールの範囲を設定
    [scrollView2 setContentSize:CGSizeMake((pageSize * width), height)];
    
    // スクロールビューを貼付ける
    [self.view addSubview:scrollView2];
    
    // スクロールビューにラベルを貼付ける
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 80, 50)];
    [button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btimg = [UIImage imageNamed:@"ボタン_01.png"];
    [button setBackgroundImage:btimg forState:UIControlStateNormal];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(1300, 30, 80, 50)];
    [button2 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btimg2 = [UIImage imageNamed:@"ボタン_01.png"];
    [button2 setBackgroundImage:btimg2 forState:UIControlStateNormal];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(2900, 30, 80, 50)];
    [button3 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    UIImage *btimg3 = [UIImage imageNamed:@"ボタン_01.png"];
    [button3 setBackgroundImage:btimg3 forState:UIControlStateNormal];
    

    
    imgView[0] = [[UIImageView alloc] initWithFrame:CGRectMake(50, 160, 200, 240)];
    imgView[1] = [[UIImageView alloc] initWithFrame:CGRectMake(370, 160, 200, 240)];
    imgView[2] = [[UIImageView alloc] initWithFrame:CGRectMake(690, 160, 200, 240)];
    imgView[3] = [[UIImageView alloc] initWithFrame:CGRectMake(1010, 160, 200, 240)];
    imgView[4] = [[UIImageView alloc] initWithFrame:CGRectMake(1340, 160, 200, 240)];
    imgView[5] = [[UIImageView alloc] initWithFrame:CGRectMake(1660, 160, 200, 240)];
    imgView[6] = [[UIImageView alloc] initWithFrame:CGRectMake(1970, 160, 200, 240)];
    imgView[7] = [[UIImageView alloc] initWithFrame:CGRectMake(2290, 160, 200, 240)];
    imgView[8] = [[UIImageView alloc] initWithFrame:CGRectMake(2610, 160, 200, 240)];
    imgView[9] = [[UIImageView alloc] initWithFrame:CGRectMake(2940, 160, 200, 240)];
    
    /*
    imgView1.image = [UIImage imageNamed:@"ca0.png"];
    imgView2.image = [UIImage imageNamed:@"ca1.png"];
    imgView3.image = [UIImage imageNamed:@"ca2.png"];
    imgView4.image = [UIImage imageNamed:@"ca3.png"];
    imgView5.image = [UIImage imageNamed:@"ca4.png"];
    imgView6.image = [UIImage imageNamed:@"ca5.png"];
    imgView7.image = [UIImage imageNamed:@"ca6.png"];
    imgView8.image = [UIImage imageNamed:@"ca7.png"];
    imgView9.image = [UIImage imageNamed:@"ca8.png"];
    imgView10.image = [UIImage imageNamed:@"ca9.png"];
     */

    [scrollView2 addSubview:imgView[0]];
    [scrollView2 addSubview:imgView[1]];
    [scrollView2 addSubview:imgView[2]];
    [scrollView2 addSubview:imgView[3]];
    [scrollView2 addSubview:imgView[4]];
    [scrollView2 addSubview:imgView[5]];
    [scrollView2 addSubview:imgView[6]];
    [scrollView2 addSubview:imgView[7]];
    [scrollView2 addSubview:imgView[8]];
    [scrollView2 addSubview:imgView[9]];
    [scrollView2 addSubview:button];
    [scrollView2 addSubview:button2];
    [scrollView2 addSubview:button3];
    
    /*
    imgView1.hidden = YES;
    imgView2.hidden = YES;
    imgView3.hidden = YES;
    imgView4.hidden = YES;
    imgView5.hidden = YES;
    imgView6.hidden = YES;
    imgView7.hidden = YES;
    imgView8.hidden = YES;
    imgView9.hidden = YES;
    imgView10.hidden = YES;
    */
    
    //ラベル
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(370, 100, 150, 50)];
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(690, 100, 150, 50)];
    label4 = [[UILabel alloc] initWithFrame:CGRectMake(1010, 100, 150, 50)];
    label5 = [[UILabel alloc] initWithFrame:CGRectMake(1340, 100, 150, 50)];
    label6 = [[UILabel alloc] initWithFrame:CGRectMake(1660, 100, 150, 50)];
    label7 = [[UILabel alloc] initWithFrame:CGRectMake(1970, 100, 150, 50)];
    label8 = [[UILabel alloc] initWithFrame:CGRectMake(2290, 100, 150, 50)];
    label9 = [[UILabel alloc] initWithFrame:CGRectMake(2610, 100, 150, 50)];
    label10 = [[UILabel alloc] initWithFrame:CGRectMake(2940, 100, 150, 50)];
    
    label1.text = [NSString stringWithFormat:@"No.1　ぱんだ！"];
    label2.text = [NSString stringWithFormat:@"No.2　もぐもぐ"];
    label3.text = [NSString stringWithFormat:@"No.3　ちらり"];
    label4.text = [NSString stringWithFormat:@"No.4　やっほーい"];
    label5.text = [NSString stringWithFormat:@"No.5　ビクッ"];
    label6.text = [NSString stringWithFormat:@"No.6　グー zzZ"];
    label7.text = [NSString stringWithFormat:@"No.7 ぐるるる…"];
    label8.text = [NSString stringWithFormat:@"No.8　ぽわーん"];
    label9.text = [NSString stringWithFormat:@"No.9　シュタッ"];
    label10.text = [NSString stringWithFormat:@"No.10　だるーん"];
    
    [scrollView2 addSubview:label1];
    [scrollView2 addSubview:label2];
    [scrollView2 addSubview:label3];
    [scrollView2 addSubview:label4];
    [scrollView2 addSubview:label5];
    [scrollView2 addSubview:label6];
    [scrollView2 addSubview:label7];
    [scrollView2 addSubview:label8];
    [scrollView2 addSubview:label9];
    [scrollView2 addSubview:label10];

    
    // ページコントロールのインスタンス化
    //CGFloat x = (width - 300) / 2;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // iPhone
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            CGFloat scale = [UIScreen mainScreen].scale;
            result = CGSizeMake(result.width * scale, result.height * scale);
            
            if(result.height == 960){
                // iPhone4 or 4S
                NSLog(@"iphone 4, 4s 下のバー");
                 pageControl2 = [[UIPageControl alloc]initWithFrame:CGRectMake(30, 420, 250, 45)];
            }
            if(result.height == 1136){
                // iPhone5
                NSLog(@"iphone 5 下のバー");
                pageControl2 = [[UIPageControl alloc]initWithFrame:CGRectMake(30, 420, 250, 45)];

            }
        }
        
    }
    
    // 背景色を設定
    pageControl2.backgroundColor = [UIColor blackColor];
    
    // ページ数を設定
    pageControl2.numberOfPages = pageSize;
    
    // 現在のページを設定
    pageControl2.currentPage = 0;
    
    
    // ページコントロールを貼付ける
    [self.view addSubview:pageControl2];
    
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    NSLog(@"defualts:%@", dictionary);
    
    for (NSString *keyName in dictionary) {
        //10枚なので10回くりかえす
        for (int j = 0; j < 10; j++) {
            NSLog(@"%d", j);
            NSString *path = [NSString stringWithFormat:@"ca%d.png", j];
            NSLog(@"path == %@", path);
            
            if ([keyName isEqualToString:path] == YES) {
                imgView[j].image = [UIImage imageNamed:path];
            }
            
        }
    }
    
    
    
    
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gallery" ofType:@"mp3"] ;
    NSURL *url = [NSURL fileURLWithPath:path];
    bgmGal = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [bgmGal setNumberOfLoops:-1];
    [bgmGal play] ;


}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    CGFloat pageWidth = scrollView2.frame.size.width;
    if ((NSInteger)fmod(scrollView2.contentOffset.x , pageWidth) == 0) {
        // ページコントロールに現在のページを設定
        pageControl2.currentPage = scrollView2.contentOffset.x / pageWidth;
    }
    
}

- (void)tapped:(UIButton *)button{
    [self performSegueWithIdentifier:@"galleryToTopSegue" sender:self];
    [bgmGal stop];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
