//
//  ExpViewController.m
//  game
//
//  Created by Kako on 2014/08/27.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "ExpViewController.h"

@interface ExpViewController ()

@end

@implementation ExpViewController

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
    
    NSInteger pageSize = 3; // ページ数
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // UIScrollViewのインスタンス化
    scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    
    // 横スクロールのインジケータを非表示にする
    scrollView.showsHorizontalScrollIndicator = NO;
    
    // ページングを有効にする
    scrollView.pagingEnabled = YES;
    
    scrollView.userInteractionEnabled = YES;
    scrollView.delegate = self;
    
    // スクロールの範囲を設定
    [scrollView setContentSize:CGSizeMake((pageSize * width), height)];
    
    // スクロールビューを貼付ける
    [self.view addSubview:scrollView];
    
    
    
       //back ボタン
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 80, 50)];
        [button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *btimg = [UIImage imageNamed:@"ボタン_01.png"];
        [button setBackgroundImage:btimg forState:UIControlStateNormal];
    
        UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(330, 30, 80, 50)];
        [button2 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *btimg2 = [UIImage imageNamed:@"ボタン_01.png"];
        [button2 setBackgroundImage:btimg2 forState:UIControlStateNormal];
    
        UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(650, 30, 80, 50)];
        [button3 addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *btimg3 = [UIImage imageNamed:@"ボタン_01.png"];
        [button3 setBackgroundImage:btimg3 forState:UIControlStateNormal];
    
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
                imgView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 90, 260, 320)];
                imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(355, 90, 260, 320)];
                imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(675, 90, 260, 320)];
                
                // ページコントロールのインスタンス化
                //CGFloat x = (width - 300) / 2;
                pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(35, 420, 250, 50)];
                
            }
            if(result.height == 1136){
                // iPhone5
                NSLog(@"iphone 5 下のバー");
                imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 370)];
                imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(330, 100, 300, 370)];
                imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(650, 100, 300, 370)];
                
                // ページコントロールのインスタンス化
                //CGFloat x = (width - 300) / 2;
                pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(30, 500, 250, 50)];

                
            }
        }
        
    }
    
    
        imgView.image = [UIImage imageNamed:@"exp1.png"];
        imgView2.image = [UIImage imageNamed:@"exp2.png"];
        imgView3.image = [UIImage imageNamed:@"exp3.png"];

       
    
    
        [scrollView addSubview:imgView];
        [scrollView addSubview:imgView2];
        [scrollView addSubview:imgView3];
        [scrollView addSubview:button];
        [scrollView addSubview:button2];
        [scrollView addSubview:button3];
    

    
    
    
    
    
    // 背景色を設定
    pageControl.backgroundColor = [UIColor blackColor];
    
    // ページ数を設定
    pageControl.numberOfPages = pageSize;
    
    // 現在のページを設定
    pageControl.currentPage = 0;
    
    
    // ページコントロールを貼付ける
    [self.view addSubview:pageControl];
    
    
    }




/**
 * スクロールビューがスワイプされたとき
 * @attention UIScrollViewのデリゲートメソッド
 */
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    if ((NSInteger)fmod(scrollView.contentOffset.x , pageWidth) == 0) {
        // ページコントロールに現在のページを設定
        pageControl.currentPage = scrollView.contentOffset.x / pageWidth;
    }
   
}


- (void)tapped:(UIButton *)button{
    [self performSegueWithIdentifier:@"expToTopSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
